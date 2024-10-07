{:name "terraform apply"
 :condition {:filetype [:tf :terraform]}
 :builder (fn []
              {
               :cmd ["terraform" "apply"]
               :components [:open_output :default]})}

