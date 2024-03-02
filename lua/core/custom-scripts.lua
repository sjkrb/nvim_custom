-- fix indentation automaticly 
vim.cmd [[
command! FixIndent :%normal gg=G
]]

local function file_exists(file)
    local f = io.open(file, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

-- Define a function to run clang-format
function run_clang_format()
    local suffix = vim.fn.expand('%:e')
    if suffix == "cpp" or suffix == "h" then
        if file_exists(".clang-format") then
            vim.cmd([[!clang-format -i %]])
        else
            vim.cmd([[!clang-format -style=Microsoft -dump-config > .clang-format]])
            vim.cmd([[!clang-format -i %]])
        end
    end

end

-- Set Ctrl+Shift+i to run clang-format in normal mode in C++ files
vim.keymap.set('n', '<C-i>', ':lua run_clang_format()<CR>', { noremap = true})

