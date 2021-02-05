def clojure_binary_impl(ctx):
    toolchain = ctx.toolchains["@rules_clojure//:toolchain"]

    deps = depset(
        direct = toolchain.files.runtime,
        transitive = [dep[JavaInfo].transitive_runtime_deps for dep in ctx.attr.deps],
    )

    ctx.actions.write(
        output = ctx.outputs.executable,
        content = "{java} -cp {classpath} clojure.main -m {main} $@".format(
            java = toolchain.java_runfiles,
            classpath = ":".join([f.short_path for f in deps.to_list()]),
            main = ctx.attr.main,
        ),
    )

    return DefaultInfo(
        runfiles = ctx.runfiles(
            files = toolchain.files.scripts + toolchain.files.jdk,
            transitive_files = deps,
        ),
    )

def clojurescript_binary_impl(ctx):
    toolchain = ctx.toolchains["@rules_clojure//:toolchain_cljs"]
    deps = depset(
        direct = toolchain.files.runtime,
        transitive = [dep[JavaInfo].transitive_runtime_deps for dep in ctx.attr.deps],
    )
    dest = "%s.js" % ctx.label.name
    js = ctx.actions.declare_file(dest)
    out_dir = ctx.actions.declare_directory("%s_out" % ctx.label.name)
    deps_list = deps.to_list()
    classpath = ":".join([f.path for f in reversed(deps_list)])
    cmd = " ".join([
        toolchain.java,
        "-cp", classpath,
        "cljs.main",
        "-d", out_dir.path,
        "-O", ctx.attr.compilation_level,
        "-o", js.path,
        "-c", ctx.attr.main,
    ])

    ctx.actions.run_shell(
        command = cmd,
        outputs = [js, out_dir],
        inputs = toolchain.files.runtime + toolchain.files.scripts + toolchain.files.jdk + deps_list,
        mnemonic = "ClojureScriptBinary",
        progress_message = "Building %s" % ctx.label,
    )

    return DefaultInfo(
        #runfiles = ctx.runfiles(
        #    files = toolchain.files.scripts + toolchain.files.jdk,
        #    transitive_files = deps,
        #),
        files = depset([js, out_dir]),
    )
