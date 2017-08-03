--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/8/1
-- Time: 上午11:57
-- To change this template use File | Settings | File Templates.
--

function Enum(table, index)
    local enumTable = {}
    local enumIndex = index or 0
    for k,v in ipairs(table) do
        enumTable[v] = enumIndex + k
    end
    return enumTable
end

Color = {
    "RED",
    "ORANGE",
    "YELLOW",
    "GREEN",
    "CYAN",
    "BLUE",
    "PURPLE"
}

function main()
    local color = Enum(Color)
    print(color.CYAN)
end

main()
