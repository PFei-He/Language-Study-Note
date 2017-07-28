--
-- Created by IntelliJ IDEA.
-- User: fay
-- Date: 2017/7/26
-- Time: 下午3:43
-- To change this template use File | Settings | File Templates.
--

function main()
    local array = {2, 1, 3, 5, 4}
    printA(quickSort(array))
end

function quickSort(array)
    return(sort(array, 1, #array))
end

function sort(array, p, r)
    p = p or 1
    r = r or #array
    if p < r then
        q = partition(array, p, r)
        sort(array, p, q - 1)
        sort(array, q + 1, r)
    end
    return array
end

function partition(array, p, r)
    local x = array[r]
    local i = p - 1
    for j = p, r - 1 do
        if array[j] <= x then
            i = i + 1
            local temp = array[i]
            array[i] = array[j]
            array[j] = temp
        end
    end
    local temp = array[i + 1]
    array[i + 1] = array[r]
    array[r] = temp
    return i + 1
end

function printA(array)
    local string = ""
    for i = 1, #array do
        string = string .. array[i] .. " "
    end
    print(string)
end

main()
