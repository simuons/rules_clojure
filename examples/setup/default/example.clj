(ns example.core
  (:require [example.math :as m]
            [java-time :as t]))

(defn -main [& args]
  (println (m/square 2))
  (println (str (t/instant))))
