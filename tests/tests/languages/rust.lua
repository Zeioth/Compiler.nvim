--- This test file run all supported cases of use.
--- @usage :luafile ~/.local/share/nvim/lazy/compiler.nvim/tests/tests/languages/rust.lua

local ms = 1000 -- wait time
local language = require("compiler.languages.rust")
local example = vim.fn.stdpath "data" .. "/lazy/compiler.nvim/tests/code samples/languages/rust/"

-- Build and run
vim.api.nvim_set_current_dir(example .. "build-and-run/")
language.action("option1")
vim.wait(ms)

-- Build
vim.api.nvim_set_current_dir(example .. "build/")
language.action("option2")
vim.wait(ms)

-- Run
language.action("option3")
vim.wait(ms)

-- Build solution (without .solution file)
vim.api.nvim_set_current_dir(example .. "solution-nofile/")
language.action("option4")
vim.wait(ms)

-- Build solution
vim.api.nvim_set_current_dir(example .. "solution/")
language.action("option4")
vim.wait(ms)

-- Cargo build and run
vim.api.nvim_set_current_dir(example .. "cargo-build-and-run/")
language.action("option5")
vim.wait(ms)

-- Cargo build
vim.api.nvim_set_current_dir(example .. "cargo-build/")
language.action("option6")
vim.wait(ms)

-- Cargo run
vim.api.nvim_set_current_dir(example .. "cargo-run/")
language.action("option7")
vim.wait(ms)

-- Cargo build --all and run
vim.api.nvim_set_current_dir(example .. "cargo-build-all-and-run/")
language.action("option8")
vim.wait(ms)

-- Cargo build --all
vim.api.nvim_set_current_dir(example .. "cargo-build-all/")
language.action("option9")
vim.wait(ms)
