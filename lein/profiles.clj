;; Stolen from Matthew Darling (matthew.darling@cenx.com)
{:user
 {:repl-options {:timeout 12000000}
  :jvm-opts ["-XX:-OmitStackTraceInFastThrow"]
  :plugins [;; REPL
            [lein-try "0.4.3"]
            ;; Application server
            [lein-immutant "2.0.0"]
            ;; Automated testing
            [lein-cloverage "1.0.9"]
            [lein-test-out "0.3.1"]
            ;; Package management
            [lein-ancient "0.6.7" :exclusions [org.clojure/clojure]]
            [lein-licenses "0.2.0"]
            [lein-clojars "0.9.1"]
            ;; Documentation
            [lein-codox "0.9.5"]
            [lein-clojuredocs "1.0.2"]
            ;; Static analysis
            [lein-typed "0.3.5"]
            [lein-bikeshed "0.4.1"]
            [lein-kibit "0.1.3" :exclusions [org.clojure/clojure]]
            [lein-newnew "0.3.4"]
            [lein-cljfmt "0.5.3"]
            [jonase/eastwood "0.2.3"]
            [venantius/yagni "0.1.4"]]
  :dependencies [[slamhound "1.5.5"]]
  :aliases {"slamhound" ["run" "-m" "slam.hound"]
            "omni" ["do"
                    ["clean"]
                    ["with-profile" "production" "deps" ":tree"]
                    ["kibit"] ["bikeshed"] ["cloverage"]]}}
 ;;https://github.com/clojure-emacs/cider/commit/0e35ce1eb484b88d9314c09d47a9510ff08b219f
 :repl {:plugins [[cider/cider-nrepl "0.10.2"] ; Clojure 1.7.0 and below
                  #_[cider/cider-nrepl "0.15.1-SNAPSHOT"] ; Clojure 1.8 and above.
                  ]
        :dependencies [[com.taoensso/timbre "4.1.0"]
                       [org.clojure/tools.namespace "0.2.11"]
                       ]
        :repl-options {:init (set! *print-length* 1000)}
        :injections [(require '[clojure.tools.namespace.repl :refer [refresh]]
                              '[clojure.repl :refer [doc source]]
                              '[clojure.pprint :refer [pprint]]
                              '[taoensso.timbre :refer [spy get-env]])]}}
