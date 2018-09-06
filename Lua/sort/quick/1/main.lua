--[[
  Copyright (c) 2018 faylib.top

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
]]

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
