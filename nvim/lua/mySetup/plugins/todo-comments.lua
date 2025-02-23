return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")
    --HACK:
    --TODO:
    --BUG:
    --NOTE:
    --WARNING:
    --PERF:
    --FIX:
    todo_comments.setup()
  end,
}
