local file = assert(io.open("data.txt", "r"), "file not found")
local totalSum = 0

local stringDigits = {
    one = 1;
    two = 2;
    three = 3;
    four = 4;
    five = 5;
    six = 6;
    seven = 7;
    eight = 8;
    nine = 9
}

for line in file:lines() do

    
    local indexes = {}
    for strNum, v in pairs(stringDigits) do
        local len = #strNum-1
        local i = 1
        while i <= #line do
            if line:sub(i, i+len) == strNum then
                table.insert(indexes, {v, i})
            end
            i = i + 1
        end 
    end

    local i = 1
    for x in line:gmatch(".") do
        if x:match("%d") then
            table.insert(indexes, {tonumber(x), i})
        end
        i = i + 1
    end
    table.sort(indexes, function(a, b)
        return a[2] < b[2]
    end)
    local firstDigit = indexes[1][1]
    local lastDigit = indexes[#indexes][1]
    local val = (tostring(firstDigit) .. lastDigit)
    totalSum = totalSum + val
    print(line, val)
end

file:close()
print(totalSum)

-- lets goo!!!
