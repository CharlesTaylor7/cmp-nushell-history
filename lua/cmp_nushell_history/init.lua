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
  -- only complete if cursor is at end of line
  -- only complete if history is a subtring match
  -- 1. remove whitespace from params.cursor_before_line
  -- 2. pass str starts-with $val to nushell command
  --
  if params.context.cursor_after_line ~= "" then
    callback()
    return
  end
  local prefix = string.gsub(params.context.cursor_before_line, "%s", "")
  local substring_cmd = "where { str starts-with r#'" .. prefix .. "'# }"
  local history_cmd = "history | get command | uniq | " .. substring_cmd .. " | to text"
  vim.system({ "nu", "-l", "-c", history_cmd }, {}, function(result)
    local items = {}
    for line in result.stdout:gmatch("[^\r\n]+") do
      table.insert(items, { label = line })
    end

    callback(items)
  end)
end

return source
