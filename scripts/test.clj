(require '[clojure.test :as test])
(require '[clojure.java.io :as io])
(require '[clojure.string :as cs])
(import (java.io PushbackReader))

(defn ns-symbol [file]
  (with-open [reader (PushbackReader. (io/reader file))]
    (loop [form (read reader false ::done)]
      (if (and (list? form) (= 'ns (first form)))
        (second form)
        (when-not (= ::done form) (recur reader))))))

(defn ns-path [file]
  (-> file ns-symbol name (.replace \- \_) (.replace \. \/) (str ".clj")))

(def sources (map io/file (filter (fn [file] (cs/ends-with? file ".clj")) *command-line-args*)))

(doseq [source sources]
  (load-file (.getCanonicalPath source)))

(let [{:keys [fail error]} (apply test/run-tests (map ns-symbol sources))]
  (if-not (= 0 fail error) (System/exit 1)))
