def _clojure_toolchain_impl(ctx):
    return [platform_common.ToolchainInfo(
        runtime = ctx.attr.classpath,
        scripts = {s.basename: s for s in ctx.files._scripts},
        jdk = ctx.attr._jdk,
        java = ctx.attr._jdk[java_common.JavaRuntimeInfo].java_executable_exec_path,
        java_runfiles = ctx.attr._jdk[java_common.JavaRuntimeInfo].java_executable_runfiles_path,
        files = struct(
            runtime = ctx.files.classpath,
            scripts = ctx.files._scripts,
            jdk = ctx.files._jdk,
        ),
    )]

clojure_toolchain = rule(
    implementation = _clojure_toolchain_impl,
    attrs = {
        "classpath": attr.label_list(),
        "_scripts": attr.label(
            default = "//scripts",
        ),
        "_jdk": attr.label(
            default = "@bazel_tools//tools/jdk:current_java_runtime",
            providers = [java_common.JavaRuntimeInfo],
        ),
    },
)
