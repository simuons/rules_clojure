load("@rules_clojure//:toolchain.bzl", "clojure_toolchain")

package(default_visibility = ["//visibility:public"])

toolchain_type(name = "toolchain_type")

clojure_toolchain(
    name = "default_clojure_toolchain",
    classpath = [
        "@org_clojure//jar",
        "@org_clojure_spec_alpha//jar",
        "@org_clojure_core_specs_alpha//jar",
    ],
)

toolchain(
    name = "clojure_toolchain",
    toolchain = ":default_clojure_toolchain",
    toolchain_type = "@rules_clojure//rules:toolchain_type",
)
