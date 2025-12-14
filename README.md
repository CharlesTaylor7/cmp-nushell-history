# cmp-nushell-history
Autocompletes in nushell script with nushell history.

This is convenient if you are iterating on a script in the terminal and want to put it into a reusable script. 

Designed as a completion source for use with [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp).

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
 
