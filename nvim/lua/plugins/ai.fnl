(local u (require :util))

[(u.tx :zbirenbaum/copilot.lua
  {:lazy true
    :cmd "Copilot"
    :event "InsertEnter"
    :opts {}
    :keys
      [(u.nlkm :ap "Copilot panel" "panel")]})

 (u.tx :olimorris/codecompanion.nvim
   {:dependencies
      ["nvim-lua/plenary.nvim"
       "nvim-treesitter/nvim-treesitter"]
    :opts 
      {:strategies {:chat {:adapter "copilot"}}
       :opts {:log_level "DEBUG"}}
    :keys
      [(u.nlkm :ac "CodeCompanionChat Toggle" "chat")
       (u.nlkm :aa "CodeCompanionActions" "chat")]})]
