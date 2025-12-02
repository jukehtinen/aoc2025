local function load_lines()
    local lines = {}
    for line in io.lines("input.txt") do
        table.insert(lines, line)
    end
    return lines
end

local line = load_lines()[1]
local sum = 0
for part in string.gmatch(line, '([^,]+)') do
    local num1 = tonumber(string.match(part, '^(%d+)-'))
    local num2 = tonumber(string.match(part, '-(%d+)$'))

    for i = num1, num2 do
        local s = tostring(i)
        for j = 1, #s do
            local search_char = s:sub(1, j)
            if #search_char * 2 > #s then
                break
            end
            if s == string.rep(search_char, 2) then
                sum = sum + i
            end
        end
    end
end
print("Part 1: " .. sum)

sum = 0
for part in string.gmatch(line, '([^,]+)') do
    local num1 = tonumber(string.match(part, '^(%d+)-'))
    local num2 = tonumber(string.match(part, '-(%d+)$'))

    for i = num1, num2 do
        local s = tostring(i)
        for j = 1, #s do
            local search_char = s:sub(1, j)

            for k = 2, #s do
                if #search_char * k > #s then
                    break
                end

                if s == string.rep(search_char, k) then
                    sum = sum + i
                    goto next
                end
            end
        end
        ::next::
    end
end
print("Part 2: " .. sum)
