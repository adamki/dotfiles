-- ibhagwan/fzf-lua

local line_ok, fzf = pcall(require, "fzf-lua")

if not line_ok then
    return
end

-- get ENV VAR from .zshrc
local rg_opts = os.getenv("FZF_DEFAULT_COMMAND")

-- Fallback if not set or doesn't start with "rg "
if rg_opts == nil or not rg_opts:match("^rg ") then
    rg_opts = "--files"
else
    -- remove leading "rg "
    rg_opts = rg_opts:gsub("^rg%s+", "")
end

fzf.setup({
    "telescope",
    winopts = {
        preview = {
            default = "bat",
        },
    },
    files = {
        cwd_prompt = true,
        rg_opts = rg_opts,
    },
})
