;; Stolen from Matthew Darling (matthew.darling@cenx.com)
{:user
 {:repl-options {:timeout 12000000}
  :jvm-opts ["-XX:-OmitStackTraceInFastThrow"]
  :plugins [;; REPL
            [lein-try "0.4.3"]
            [venantius/ultra "0.4.0"]
            ;; Application server
            [lein-immutant "2.0.0"]
            ;; Automated testing
            [lein-cloverage "1.0.2"]
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
            [jonase/eastwood "0.2.1"]
            [lein-bikeshed "0.2.0"]
            [lein-kibit "0.1.2" :exclusions [org.clojure/clojure]]
            [lein-newnew "0.3.4"]
            [lein-cljfmt "0.5.3"]]}
  ;;https://github.com/clojure-emacs/cider/commit/0e35ce1eb484b88d9314c09d47a9510ff08b219f
 :repl {:plugins [[cider/cider-nrepl "0.12.0"]
                 [refactor-nrepl "2.2.0"]]
        :dependencies [;; REPL
                       ^:replace [org.clojure/tools.nrepl "0.2.12"]
                       ;; Debug
                       [org.clojars.gjahad/debug-repl "0.3.3"]
                       [difform "1.1.2"]
                       [spyscope "0.1.5"]
                       [org.clojure/tools.trace "0.7.8"]
                       [org.clojure/tools.namespace "0.2.10"]
                       [alembic "0.3.2"]
                       [im.chit/vinyasa.inject "0.3.4"]
                       [im.chit/vinyasa.reflection "0.3.4"]
                       [io.aviso/pretty "0.1.17"]
                       [slamhound "1.5.5"]
                       [criterium "0.4.3"]]
         :repl-options {:init (set! *print-length* 1000)
                        :nrepl-middleware
                        [cider.nrepl.middleware.apropos/wrap-apropos
                         cider.nrepl.middleware.classpath/wrap-classpath
                         cider.nrepl.middleware.complete/wrap-complete
                         cider.nrepl.middleware.debug/wrap-debug
                         cider.nrepl.middleware.format/wrap-format
                         cider.nrepl.middleware.info/wrap-info
                         cider.nrepl.middleware.inspect/wrap-inspect
                         cider.nrepl.middleware.macroexpand/wrap-macroexpand
                         cider.nrepl.middleware.ns/wrap-ns
                         cider.nrepl.middleware.pprint/wrap-pprint
                         cider.nrepl.middleware.pprint/wrap-pprint-fn
                         cider.nrepl.middleware.refresh/wrap-refresh
                         cider.nrepl.middleware.resource/wrap-resource
                         cider.nrepl.middleware.stacktrace/wrap-stacktrace
                         cider.nrepl.middleware.test/wrap-test
                         cider.nrepl.middleware.trace/wrap-trace
                         cider.nrepl.middleware.out/wrap-out
                         cider.nrepl.middleware.undef/wrap-undef
                         cider.nrepl.middleware.version/wrap-version]}
         :injections [(require 'spyscope.core)
                      (require '[vinyasa.inject :as inject])
                      (inject/in [vinyasa.inject :refer [inject [in inject-in]]]

                                 [alembic.still [distill pull] lein [load-project pull-project]]
                                 [clojure.java.shell sh]
                                 [clojure.pprint pprint]
                                 [clojure.repl doc source]
                                 [clojure.tools.namespace.repl refresh]

                                 clojure.core
                                 [vinyasa.reflection .& .> .? .* .% .%>])]}}
