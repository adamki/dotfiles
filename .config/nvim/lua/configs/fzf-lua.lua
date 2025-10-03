local ok, fzf = pcall(require, "fzf-lua")
if not ok then
    return
end

local fzf_cmd = os.getenv("FZF_DEFAULT_COMMAND")
if not fzf_cmd or not fzf_cmd:match("^rg ") then
    fzf_cmd = "rg --files"
end

-- default ignored globs (you can still override)
local default_file_globs = {
    "!assets/**/*.min.js.LICENSE.txt",
    "!assets/**/*.min.js.map",
    "!assets/**/*.min.js",
    "!node_modules/**",
}

-- globs to ignore for grep
local grep_ignore_globs = {
    "!assets/**/*.min.js.LICENSE.txt",
    "!assets/**/*.min.js.map",
    "!node_modules/**",
}

-- helper to turn table into --glob args
local function make_globs(globs)
    local parts = {}
    for _, g in ipairs(globs) do
        table.insert(parts, "--glob '" .. g .. "'")
    end
    return table.concat(parts, " ")
end

fzf.setup({
    "telescope",
    winopts = {
        preview = { default = "bat", title = true, border = "rounded" },
    },
    files = {
        cmd = fzf_cmd .. " " .. make_globs(default_file_globs),
        cwd_prompt = true,
        history = 100, -- store the last 100 search queries
    },
    grep = {
        rg_opts = "--no-binary " .. make_globs(grep_ignore_globs),
        cwd_prompt = true,
        silent = true,
        history = 100, -- store the last 100 search queries
    },
})
