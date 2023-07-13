-- 分割字符串
local function split(str, reps)
  local resultStrList = {}
  string.gsub(str, '[^' .. reps .. ']+', function(w)
    table.insert(resultStrList, w)
  end)
  return resultStrList
end

local tools = {}
tools.url_replace = function(url)
  return url
  -- if url then
  --   local data = split(url, '/')
  --   if data then
  --     data[1] = 'XIAOBINGGA/'
  --     return table.concat(data)
  --   end
  --   return url
  -- end
  -- return url
end
return tools
