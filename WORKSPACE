workspace(name = "rules_clojure")

load("//:repositories.bzl", "rules_clojure_dependencies", "rules_clojure_toolchains")

rules_clojure_dependencies()

rules_clojure_toolchains()

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "io_bazel_stardoc",
    remote = "https://github.com/bazelbuild/stardoc.git",
    tag = "0.4.0",
)

load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")

stardoc_repositories()
