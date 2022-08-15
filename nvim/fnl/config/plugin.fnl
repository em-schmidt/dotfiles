(module config.plugin)

; Should configure plugins with configs in plugin/
;
; different from Olical's plugin logic since not using packer

(require :config.plugin.treesitter)
(require :config.plugin.which-key)
(require :config.plugin.lspconfig)
(require :config.plugin.telescope)
(require :config.plugin.cmp)
(require :config.plugin.conjure)
