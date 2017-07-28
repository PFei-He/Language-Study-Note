--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/7/27
-- Time: 下午4:34
-- To change this template use File | Settings | File Templates.
--

local hash = {a = 100, 10, 20, [5] = 30 }

for k,v in ipairs(hash) do
    print("ipairs", k, v)
end

for k,v in pairs(hash) do
    print("pairs", k, v)
end
