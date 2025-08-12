
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
           :strategies {:chat {:adapter "anthropic"
                               :model "claude-opus-4-20250514"}
                        :inline {:adapter "anthropic"
                                 :model "claude-opus-4-20250514"}}
           :opts {:log_level "DEBUG"}
           :display {:diff {:enabled true
                            :provider "mini_diff"}}}
    :keys [(u.nlkm :ac "CodeCompanionChat Toggle" "chat")
           (u.vlkm :ac "CodeCompanionChat Toggle" "chat")
           (u.nlkm :aa "CodeCompanionActions" "chat")
           (u.vlkm :aa "CodeCompanionActions" "chat")]})

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
                (diff.setup {:source (diff.gen_source.none)})))})
 ;; https://github.com/NickvanDyke/opencode.nvim
 (u.tx :NickvanDyke/opencode.nvim
   {:dependencies ["folke/snacks.nvim"]
    :keys [(u.nlkm :ot "lua require('opencode').toggle()" "toggle embeded opencode")
           (u.nlkm :oa "lua require('opencode').ask()" "ask opencode")
           (u.vlkm :oa "lua require('opencode').ask('@selection: ')" "ask opencode about selection")
           (u.nlkm :op "lua require('opencode').select_prompt()" "select prompt")
           (u.vlkm :op "lua require('opencode').select_prompt()" "select prompt")
           (u.nlkm :on "lua require('opencode').command('session_new')" "new session")
           (u.nlkm :os "lua require('opencode').command('switch_mode')" "switch mode")
           (u.nlkm :oy "lua require('opencode').command('messages_copy')" "copy messages")]})]

