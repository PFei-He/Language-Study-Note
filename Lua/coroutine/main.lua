--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/5/4
-- Time: 上午10:09
-- To change this template use File | Settings | File Templates.
--

--$ lua main.lua


local co = coroutine.create(function ()
    print("Hello World!")
end)
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))
