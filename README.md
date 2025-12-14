# cmp-nushell-history
Neovim Completion for [nushell](https://www.nushell.sh/) history. Works with both text and sqlite history backends.

Completion source for use with [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp).

## Setup with lazy vim:

```lua
{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "CharlesTaylor7/cmp-nushell-history",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      sources = {
        { name = "nushell_history" },
         ... other sources
      },
      ... other config
    })
  end
```
 
