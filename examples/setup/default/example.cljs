(ns example.core
  (:require [example.math :as m]))

(defn -main [& args]
  (js/console.log (m/square 4))
  (js/console.log (js/moment)))

(-main)
