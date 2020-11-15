# [Clojure](https://clojure.org) rules for [Bazel](https://bazel.build)

![CI](https://github.com/simuons/rules_clojure/workflows/CI/badge.svg)

## Setup

Add the following to your `WORKSPACE`:

```skylark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_clojure",
    sha256 = "26b11fe38e3c3981d211d2405556c9262f584a6d1fa6559acc4c325ee730560c",
    strip_prefix = "rules_clojure-62c1ee4fb398a473d178831a83c9a032707efd15",
    urls = ["https://github.com/simuons/rules_clojure/archive/62c1ee4fb398a473d178831a83c9a032707efd15.tar.gz"],
)

load("@rules_clojure//:repositories.bzl", "rules_clojure_dependencies", "rules_clojure_toolchains")

rules_clojure_dependencies()

rules_clojure_toolchains()
```

**Note**: Update commit and sha256 as needed.

## Rules

Load rules in your `BUILD` files from [@rules_clojure//:rules.bzl](rules.bzl)

- [clojure_binary](docs/rules.md#clojure_binary)
- [clojure_java_library](docs/rules.md#clojure_java_library)
- [clojure_library](docs/rules.md#clojure_library)
- [clojure_repl](docs/rules.md#clojure_repl)
- [clojure_test](docs/rules.md#clojure_test)

## Dependencies

Rules require `clojure.jar` in implicit classpath via toolchains.

Defaults are loaded with `rules_clojure_dependencies` from [@rules_clojure//:repositories.bzl](repositories.bzl) using `jvm_maven_import_external`.

Please see [example](examples/setup/custom) of dependencies loaded with `rules_jvm_external`. 

## Toolchains

Rules require `@rules_clojure//:toolchain` type.

Default is registered with `rules_clojure_toolchains` from [@rules_clojure//:repositories.bzl](repositories.bzl)

Custom toolchain can be defined with `clojure_toolchain` rule from [@rules_clojure//:toolchains.bzl](toolchains.bzl)

Please see [example](examples/setup/custom) of custom toolchain.
