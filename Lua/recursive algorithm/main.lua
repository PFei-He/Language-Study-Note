--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/7/24
-- Time: 上午10:02
-- To change this template use File | Settings | File Templates.
--

function main()
    recursive(0)
end

function recursive(i)
    if i >= 10 then
        return
    else
        print(i)
        i = i + 1
        recursive(i)
    end
end

main()
