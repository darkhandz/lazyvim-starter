local M = {}

function M.select_git_author(callback)
  local fzf = require("fzf-lua")
  fzf.fzf_exec("git log --format='%aN <%aE>' | sort | uniq", {
    prompt = "Git Authors> ",
    actions = {
      ["default"] = function(selected)
        if selected and selected[1] then
          local author = selected[1]:gsub("^%s*(.-)%s*$", "%1")
          callback(author)
        end
      end,
    },
  })
end

return M
