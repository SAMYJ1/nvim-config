return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      open_files_do_not_replace_types = { "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        follow_current_file = { enabled = false },
      },
    },
    keys = {
      {
        "<leader>bf",
        function()
          require("neo-tree.command").execute({ reveal = true, reveal_force_cwd = true })
        end,
        desc = "Reveal current file in Neo-tree",
      },
      {
        "<leader>bt",
        function()
          local enable_auto_focus = require("neo-tree").config.filesystem.follow_current_file

          if enable_auto_focus.enabled then
            local event_name = require("neo-tree.events").VIM_BUFFER_ENTER
            require("neo-tree.sources.manager").unsubscribe("filesystem", {
              event = event_name,
              id = "filesystem" .. "." .. event_name,
            })
            enable_auto_focus.enabled = false
          else
            require("neo-tree.sources.filesystem").setup({
              follow_current_file = { enabled = true },
            }, require("neo-tree").config)
            enable_auto_focus.enabled = true

            require("neo-tree.command").execute({ reveal = true, reveal_force_cwd = true })
          end
        end,
        desc = "Toggle auto focus file in Neo-tree",
      },
    },
  },
}
