--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/7/20
-- Time: 上午10:26
-- To change this template use File | Settings | File Templates.
--

function printA(array)
    local string = ""
    for i = 1, #array do
        string = string .. array[i] .. " "
    end
    print(string)
end

local array = {1, 2, 3, 4, 5}
printA(array)
