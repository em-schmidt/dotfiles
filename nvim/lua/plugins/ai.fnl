
(local u (require :util))

(fn setup-anthropic-adapter []
  "Configure Anthropic adapter with 1Password integration"
  ((. (require :codecompanion.adapters) :extend) 
   :anthropic 
   {:env {:api_key "cmd:op read --account my.1password.com op://AI/Anthropic/credential --no-newline"}}))

(fn setup-openai-adapter []
  "Configure OpenAI adapter with 1Password integration"
  ((. (require :codecompanion.adapters) :extend)
   :openai
   {:env {:api_key "cmd:op read --account my.1password.com op://AI/OpenAI/credential --no-newline"}}))

[;; https://github.com/zbirenbaum/copilot.lua
 (u.tx :zbirenbaum/copilot.lua
   {:lazy true
    :cmd "Copilot"
    :event "InsertEnter"
    :opts {}})

 ;; https://github.com/olimorris/codecompanion.nvim
 (u.tx :olimorris/codecompanion.nvim
   {:dependencies ["nvim-lua/plenary.nvim"
                   "nvim-treesitter/nvim-treesitter"]
    :opts {:adapters {:anthropic setup-anthropic-adapter
                      :openai setup-openai-adapter}
           :extensions {:mcphub {:callback "mcphub.extensions.codecompanion"
                                 :opts {:make_vars true
                                        :make_slash_commands true
                                        :show_results_in_chat true}}}
           :strategies {:chat {:adapter "anthropic"}
                        :inline {:adapter "anthropic"}}
           :opts {:log_level "DEBUG"}
           :display {:diff {:enabled true
                            :provider "mini_diff"}}}
    :keys [(u.nlkm :ac "CodeCompanionChat Toggle" "chat")
           (u.nlkm :aa "CodeCompanionActions" "chat")]})

 ;; https://github.com/ravitemer/mcphub.nvim
 (u.tx :ravitemer/mcphub.nvim
   {:dependencies ["nvim-lua/plenary.nvim"]
    :build :bundled_build.lua
    :config (fn [] 
              ((. (require :mcphub) :setup) {:use_bundled_binary true}))}) 

 ;; https://github.com/echasnovski/mini.diff
 (u.tx :echasnovski/mini.diff
   {:config (fn []
              (let [diff (require :mini.diff)]
                (diff.setup {:source (diff.gen_source.none)})))})]
