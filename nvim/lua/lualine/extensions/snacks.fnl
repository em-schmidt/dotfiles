
(fn get_short_cwd
  []
  "Get the short version of the current working directory"
  (vim.fn.fnamemodify (vim.fn.getcwd ) ":~"))

(local sections
  {:lualine_a [get_short_cwd]})

(local filetypes
 ["snacks_layout_box"])

{: sections
 : filetypes}
