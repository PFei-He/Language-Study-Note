--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/8/11
-- Time: 下午4:25
-- To change this template use File | Settings | File Templates.
--

function main(...)
    for k,v in ipairs({...}) do
        print(k,v)
    end
end

main("A", "B", "C");
