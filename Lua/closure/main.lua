--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/5/8
-- Time: 下午4:21
-- To change this template use File | Settings | File Templates.
--


function add(x)
    return function(y)
        return x + y
    end
end

addx = add(8)

print(addx(10))
