--[[
    RULES:
    You CAN edit everything above the line 10.
    You CAN'T edit anything below the line 10.
    You can't hook any function.
    You can't re-define functions.
    Don't mess with getfenv or getgenv, it's not needed.
    

    Objective:
    Code must not throw any error.
    Output must be number/string "8008135".
]]--

local a,b,c = 1,2,3;

--// solution below

a=setmetatable({},{
    __pow = function()
        return setmetatable({},{
            __mul = function()
                return setmetatable({},{
                    __tostring = function() return "8008135" end,
                    __div = function() return 1 end,
                    __mul = function() return setmetatable({},
                            {__mul=function()
                                return setmetatable({},{
                                    __index = function() return true end, 
                                    __mul = function() return 1 end
                                }) 
                            end
                        }) 
                    end
                })    
            end,
        })    
    end,
    __mul = function() return 1 end
});

--// solution above


xpcall(function() 
    local _one_ = a*b*c;
    local _two_ = math.atan((_one_/b)^c)*(a^b);
    local _three_ = ("Impossible Challenge!!!!").sub(tostring(_two_),b*a,c*a);
    local _four_ = ((_three_/_two_*_one_)*_two_)*6
    xpcall(function() 
        local a = (function(a) 
            if not _four_[a] then
                error(("%s"):format(a))
            end
            return _three_
        end)(_four_);
        if string.byte(a)~= 56 then
            error ("0x0"):format(a);
        end
        print("Number: ",_two_)
    end,function() print("Failed") end)
end,function() print("Failed") end)

