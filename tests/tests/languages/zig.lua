--- This test file run all supported cases of use.
--- @usage :luafile ~/.local/share/nvim/lazy/compiler.nvim/tests/tests/languages/zig.lua

local ms = 1000 -- wait time
local language = require("compiler.languages.zig")
local example = vim.fn.stdpath "data" .. "/lazy/compiler.nvim/tests/code samples/languages/zig/"

-- Build and run
vim.api.nvim_set_current_dir(example .. "build-and-run/")
language.action("option1")
vim.wait(ms)

-- Build
vim.api.nvim_set_current_dir(example .. "build/")
language.action("option2")
vim.wait(ms)
