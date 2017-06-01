--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/5/31
-- Time: 下午3:19
-- To change this template use File | Settings | File Templates.
--

function add(x)
    return function(y)
        return x + y
    end
end

print(add(8)(10))
