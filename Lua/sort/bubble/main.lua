--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/7/20
-- Time: 上午10:19
-- To change this template use File | Settings | File Templates.
--

function main()
    local table = {2, 1, 3, 5, 4}
    print_t(bubbleSort(table))
end

function bubbleSort(table)
    for i = 1, #table do
        for j = 1, #table - i do
            if table[j + 1] and table[j] > table[j + 1] then
                table[j + 1], table[j] = table[j], table[j + 1]
            end
        end
    end
    return table
end

function print_t(table)
    local string = ""
    for i = 1,#table do
        string = string .. table[i] .. " "
    end
    print(string)
end

main()
