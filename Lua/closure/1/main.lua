--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/5/31
-- Time: 下午3:19
-- To change this template use File | Settings | File Templates.
--

function main()
    say(lambda)
end

lambda = function(v)
    print(v)
    return "Hello Lua!"
end

function say(lambda)
    print(lambda("Hello World!"))
end

main()
