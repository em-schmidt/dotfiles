
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

[(u.tx :zbirenbaum/copilot.lua
   {:lazy true
    :cmd "Copilot"
    :event "InsertEnter"
    :opts {}
    :keys [(u.nlkm :ap "Copilot panel" "panel")]})

 (u.tx :olimorris/codecompanion.nvim
   {:dependencies ["nvim-lua/plenary.nvim"
                   "nvim-treesitter/nvim-treesitter"]
    :opts {:adapters {:anthropic setup-anthropic-adapter
                      :openai setup-openai-adapter}
           :strategies {:chat {:adapter "copilot"}}
           :opts {:log_level "DEBUG"}
           :display {:diff {:enabled true
                            :provider "mini_diff"}}}
    :keys [(u.nlkm :ac "CodeCompanionChat Toggle" "chat")
           (u.nlkm :aa "CodeCompanionActions" "chat")]})

 (u.tx :echasnovski/mini.diff
   {:config (fn []
              (let [diff (require :mini.diff)]
                (diff.setup {:source (diff.gen_source.none)})))})]
