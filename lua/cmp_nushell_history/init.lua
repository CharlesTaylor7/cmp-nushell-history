local cmp = require("cmp")
local source = {}

function source.new()
  return setmetatable({}, { __index = source })
end

function source:is_available()
  return vim.bo.filetype == "nu"
end

function source:get_debug_name()
  return "nushell_history"
end

function source:resolve(completion_item, callback)
  callback(completion_item)
end

function source:execute(completion_item, callback)
  callback(completion_item)
end

function source:complete(params, callback)
  local items = {}
  vim.system({ "nu", "-c", "history | get command | to text" }, {}, function(result)
    for line in result.stdout:gmatch("[^\r\n]+") do
      table.insert(items, { label = line })
    end
    callback(items)
  end)
end

return source
