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
    if #array <= 1 then
        return array
    end

    local pivot = array[1]
    local left = {}
    local right = {}

    for k,v in ipairs(array) do
        if v < pivot then
            table.insert(left, v)
        elseif v > pivot then
            table.insert(right, v)
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
