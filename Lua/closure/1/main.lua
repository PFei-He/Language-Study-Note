--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/5/31
-- Time: 下午3:19
-- To change this template use File | Settings | File Templates.
--

function main()
    say(reply)
end

reply = function(content)
    print(content)
    return "Hello Lua!"
end

function say(reply)
    print(reply("Hello World!"))
end

main()
