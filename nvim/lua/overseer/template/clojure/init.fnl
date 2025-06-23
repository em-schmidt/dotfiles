(local overseer (require "overseer"))

(local tmpl {:priority 60
                    :params {:args {:optional true 
                                    :type :list
                                    :delimiter " "}
                             :cwd {:optional true}
                             :bin {:optional true
                                   :type :string}}
                    :builder (fn [params]
                               {:cmd [params.bin]
                                :args params.args
                                :cwd params})})

(fn get_depsfile [opts]
  "find the project deps.edn file"
  (-> (vim.fs.find "deps.edn" {:upward true :type "file" :path opts.dir})
      (. 1)))

{:cache_key (fn [opts] (get_depsfile opts))
 :condition {:callback (fn [opts]
                        (if (= 0 (vim.fn.executable "clojure")) (values false "Command 'clojure' not found")
                            (not (get_depsfile opts)) (values false "No deps.edn found")
                            true))}
 :generator (fn [opts cb] 
              (let [depsfile (assert (get_depsfile opts))
                    cwd (vim.fs.dirname depsfile)]
                {}))}

