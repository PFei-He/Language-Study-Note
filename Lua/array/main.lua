--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/7/17
-- Time: 下午4:58
-- To change this template use File | Settings | File Templates.
--

function print_r(arr, indentLevel)
    local str = ""
    local indentStr = "#"

    if(indentLevel == nil) then
        print(print_r(arr, 0))
        return
    end

    for i = 0, indentLevel do
        indentStr = indentStr.."\t"
    end

    for index,value in pairs(arr) do
        if type(value) == "table" then
            str = str..indentStr..index..": \n"..print_r(value, (indentLevel + 1))
        else
            str = str..indentStr..index..": "..value.."\n"
        end
    end
    return str
end

local array = {1, 2, 3, 4, 5}
print_r(array)
