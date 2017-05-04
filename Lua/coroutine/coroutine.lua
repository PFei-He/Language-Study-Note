--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/5/4
-- Time: 下午3:18
-- To change this template use File | Settings | File Templates.
--


local co = coroutine.create(function ()
    print("Hello World!")
end)
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))
