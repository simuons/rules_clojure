load("@rules_clojure//:toolchains.bzl", "clojure_toolchain")

toolchain_type(
    name = "toolchain",
    visibility = ["//visibility:public"],
)

clojure_toolchain(
    name = "default_clojure_toolchain",
    classpath = [
        "@org_clojure",
        "@org_clojure_spec_alpha",
        "@org_clojure_core_specs_alpha",
    ],
)

toolchain(
    name = "clojure_toolchain",
    toolchain = ":default_clojure_toolchain",
    toolchain_type = "@rules_clojure//:toolchain",
)

toolchain_type(
    name = "toolchain_cljs",
    visibility = ["//visibility:public"],
)

clojure_toolchain(
    name = "default_clojurescript_toolchain",
    classpath = [
        "@org_clojure_clojurescript",
    ],
)

toolchain(
    name = "clojurescript_toolchain",
    toolchain = ":default_clojurescript_toolchain",
    toolchain_type = "@rules_clojure//:toolchain_cljs",
)
