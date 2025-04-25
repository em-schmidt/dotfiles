(local u (require :util))

[(u.tx :zbirenbaum/copilot.lua
  {:lazy true
   :cmd "Copilot"
   :event "InsertEnter"
   :opts {}
   :keys
     [(u.nlkm :ap "Copilot panel" "panel")]})]

