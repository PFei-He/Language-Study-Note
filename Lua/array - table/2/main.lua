--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/7/20
-- Time: 上午10:26
-- To change this template use File | Settings | File Templates.
--

function print_t(table)
    local string = ""
    for i = 1,#table do
        string = string .. table[i] .. " "
    end
    print(string)
end

local table = {1, 2, 3, 4, 5}
print_t(table)
