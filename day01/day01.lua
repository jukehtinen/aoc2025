local function load_lines()
    local lines = {}
    for line in io.lines("input.txt") do
        table.insert(lines, line)
    end
    return lines
end

local dial = 50
local zero_pos = 0
for _, line in ipairs(load_lines()) do
    local dir, num = line:match("(%a+)(%d+)")
    num = tonumber(num)
    if dir == "R" then
        dial = (dial + num) % 100
    else
        dial = (dial - num) % 100
    end
    if dial == 0 then
        zero_pos = zero_pos + 1
    end
end
print("Part 1:", zero_pos)

dial = 50
zero_pos = 0
for _, line in ipairs(load_lines()) do
    local dir, num = line:match("(%a+)(%d+)")
    num = tonumber(num)

    if dir == "R" then
        for _ = 1, num do
            dial = (dial + 1) % 100
            if dial == 0 then
                zero_pos = zero_pos + 1
            end
        end
    else
        for _ = 1, num do
            dial = (dial - 1) % 100
            if dial == 0 then
                zero_pos = zero_pos + 1
            end
        end
    end
end

print("Part 2:", zero_pos)
