--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/7/20
-- Time: 上午10:19
-- To change this template use File | Settings | File Templates.
--

function main()
    local array = {2, 1, 3, 5, 4}
    printA(bubbleSort(array))
end

function bubbleSort(array)
    for i = 1, #array do
        for j = 1, #array - i do
            if array[j + 1] and array[j] > array[j + 1] then
                array[j + 1], array[j] = array[j], array[j + 1]
            end
        end
    end
    return array
end

function printA(array)
    local string = ""
    for i = 1, #array do
        string = string .. array[i] .. " "
    end
    print(string)
end

main()
