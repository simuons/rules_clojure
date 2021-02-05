load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_import_external", "jvm_maven_import_external")

def rules_clojure_dependencies():
    jvm_maven_import_external(
        name = "org_clojure",
        artifact = "org.clojure:clojure:1.10.1",
        artifact_sha256 = "d4f6f991fd9ed2a59e7ea4779010b3b069a2b905f3463136c42201106b4ad21a",
        server_urls = ["https://repo1.maven.org/maven2/"],
    )

    jvm_maven_import_external(
        name = "org_clojure_spec_alpha",
        artifact = "org.clojure:spec.alpha:0.2.176",
        artifact_sha256 = "fc4e96ecff34ddd2ab7fd050e74ae1379342ee09daa6028da52024c5de836cc4",
        server_urls = ["https://repo1.maven.org/maven2/"],
    )

    jvm_maven_import_external(
        name = "org_clojure_core_specs_alpha",
        artifact = "org.clojure:core.specs.alpha:0.2.44",
        artifact_sha256 = "3b1ec4d6f0e8e41bf76842709083beb3b56adf3c82f9a4f174c3da74774b381c",
        server_urls = ["https://repo1.maven.org/maven2/"],
    )

    jvm_import_external(
        rule_name = "java_import",
        name = "org_clojure_clojurescript",
        artifact_sha256 = "dcc98e103d281d4eab21ca94fba11728e9f587c3aa09c8ffc3b96cff210adcce",
        artifact_urls = ["https://github.com/clojure/clojurescript/releases/download/r1.10.758/cljs.jar"],
    )

def rules_clojure_toolchains():
    native.register_toolchains("@rules_clojure//:clojure_toolchain")
    native.register_toolchains("@rules_clojure//:clojurescript_toolchain")
