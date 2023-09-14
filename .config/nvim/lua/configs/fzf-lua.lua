-- ibhagwan/fzf-lua

local line_ok, fzf = pcall(require, "fzf-lua")

if not line_ok then
  return
end

fzf.setup({
  "telescope",
  winopts={
    preview={
      default="bat"
    }
  },
  files = {
    cwd_prompt = true
  }
})
