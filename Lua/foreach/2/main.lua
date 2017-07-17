--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/7/17
-- Time: 下午3:21
-- To change this template use File | Settings | File Templates.
--

local table = {a = "1", b = "2" }
print(table)
for key,value in pairs(table) do
    print(key)
    print(value)
end
