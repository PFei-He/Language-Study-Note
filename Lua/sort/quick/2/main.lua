--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/7/27
-- Time: 下午4:34
-- To change this template use File | Settings | File Templates.
--

function main()
    local array = {2, 1, 3, 5, 4}
    printA(quickSort(array))
end

function quickSort(array)
    if #array <= 1 then
        return array
    end

    local pivot = array[1]
    local left = {}
    local right = {}

    for i = 2, #array do
        if array[i] < pivot then
            table.insert(left, array[i])
        elseif array[i] > pivot then
            table.insert(right, array[i])
        end
    end

    local result = {}

    for i = 1, #left do
        table.insert(result, quickSort(left)[i])
    end

    table.insert(result, pivot)

    for i = 1, #right do
        table.insert(result, quickSort(right)[i])
    end

    return result
end

function printA(array)
    local string = ""
    for i = 1, #array do
        string = string .. array[i] .. " "
    end
    print(string)
end

main()
