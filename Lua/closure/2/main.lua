--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/6/15
-- Time: 下午2:25
-- To change this template use File | Settings | File Templates.
--

function main()
    say(reply)
end

finish = function(content)
    print(content)
end

reply = function(finish)
    print("Hello Lua!")
    finish("^_^")
end

function say(reply)
    print("Hello World!")
    reply(finish)
end

main()
