--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/5/4
-- Time: 上午10:09
-- To change this template use File | Settings | File Templates.
--

--$ lua main.lua


A = {obj = "A"}
function A:method1(v)
    self.obj = self.obj .. v
end
a = A
a:method1("a")
print(a.obj)



B = {obj = "B"}
function B.method2(self, v)
    self.obj = self.obj .. v
end
b = B
b.method2(b, "b")
print(b.obj)
