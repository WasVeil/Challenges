--[[
  CAN'T HOOK PRINT.
  CAN'T CHANGE STRING METATABLE.
  CAN'T CHANGE ANY GIVEN CODE.

  Objective: Must print "b" before printing "a".
]]
-- (yes, re-used the same method from 1+1.)
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

encoded=encoded:gsub("%*97%*0%*4%*2%*0%*0%*0%*0%*0%*0%*0%*98%*","*98*0*4*2*0*0*0*0*0*0*0*97*")

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

--// solution above

print("a")
print("b")
