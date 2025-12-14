local source

function source:is_available()
  vim.print("is_available?")
  return vim.bo.filetype == "nu"
end

function source:complete(params, callback)
  local file = io.open("~/.config/nushell/history.txt", "r")
  if not file then
    return nil
  end
  local content = file:read("*a")
  file:close()

  local items = {}
  for line in content:gmatch("[^\r\n]+") do
    table.insert(items, { label = line })
  end
  vim.print(items)
  callback(items)
end

require("cmp").register_source("nushell-history", source)
