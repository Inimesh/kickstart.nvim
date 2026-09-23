-- Completes a styler.nvim highlight namespace so that no group in it falls
-- through to the global colorscheme.
--
-- A window with its own highlight namespace resolves each group in that
-- namespace first and falls back to the global namespace (0) only when the
-- group is missing there (see :h nvim_win_set_hl_ns). Every group the global
-- colorscheme defines that the window's theme does not therefore renders in
-- the global theme's colours. `fill` closes that gap by defining each such
-- group inside the namespace, using the built-in default captured by
-- `snapshot`, or for a dotted tree-sitter capture with no default, a link to
-- its parent capture (the same shape as Neovim's own implicit fallback).
local M = {}

-- Built-in definitions of namespace 0 before any colorscheme has run.
local defaults = {}

-- Namespaces already filled, keyed by namespace id.
local filled = {}

-- Must run before the first `:colorscheme` so that namespace 0 still holds
-- only Neovim's built-in definitions.
function M.snapshot()
  defaults = vim.api.nvim_get_hl(0, {})
end

---@param group string
---@return string|nil parent  `@a.b` for `@a.b.c`; nil for a top-level capture or a legacy group.
local function parent_capture(group)
  return group:match '^(@.+)%.[^.]+$'
end

---@param ns integer  highlight namespace id created by styler.nvim
function M.fill(ns)
  if filled[ns] then
    return
  end
  filled[ns] = true

  local in_ns = vim.api.nvim_get_hl(ns, {})
  for group in pairs(vim.api.nvim_get_hl(0, {})) do
    if in_ns[group] == nil then
      local def = defaults[group]
      if def and next(def) ~= nil then
        vim.api.nvim_set_hl(ns, group, def)
      else
        local parent = parent_capture(group)
        if parent then
          vim.api.nvim_set_hl(ns, group, { link = parent })
        end
      end
    end
  end
end

return M
