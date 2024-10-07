{:name "terraform plan"
 :condition {:filetype [:tf :terraform]}
 :builder (fn []
              {
               :cmd ["terraform" "plan"]
               :components [:open_output :default]})}


