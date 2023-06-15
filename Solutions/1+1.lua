--[[
  RULES:
  You CAN'T hook print.
  You CAN'T edit anything below "--// SOLUTION ABOVE"
  IT MUST OUTPUT 3.

  Oh yeah, as far as I know metatables on numbers are not possible. (even using debug)
]]

--// SOLUTION BELOW

local d = debug.getinfo(1,"f").func
local k = string.dump(d);

function encodeString(str)
  local encoded = ""
  for i = 1, #str do
    encoded = encoded .. "*" .. string.byte(str, i)
  end
  return encoded .. "*"
end

local encoded = encodeString(k); -- I preffer doing this, ok?.

encoded = (encoded:gsub("%*0%*64%*2%*0%*0%*0%*0%*", "*8*64*2*0*0*0*0*"))

local function decodeBytecode(str) 
  local bytecode = {}
  for byte in str:gmatch("%d+") do
    table.insert(bytecode, tonumber(byte))
  end
  return string.char(unpack(bytecode))
end 

_ = _ or false
if not _ then
  _=true
  loadstring(decodeBytecode(encoded))(); 
  return
end

--// SOLUTION ABOVE

print(1+1)
