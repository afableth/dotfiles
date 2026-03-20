return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- アイコン表示用のプラグイン
    },
    event = "VeryLazy",
    opts = function()
        local function current_time()
            return os.date("%H:%M:%S")
        end

        local function study_timer()
            local unix = os.time()
            local this_hour = unix % 1800
            if this_hour <= 1500 then
                    return tostring((1500 - this_hour))
            else
                    return tostring((1800 - this_hour))
            end
        end  
        local function minimal_mode()
            local mode = vim.api.nvim_get_mode().mode
            local map = { n = "N", i = "I", v = "V", V = "VL", ['\22'] = "VB", c = "C" }
            return map[mode] or m
        end
        
        return {
            options = {
                icons_enabled = true,
                theme = "horizon", -- カラースキーム
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },

            sections = {
                lualine_a = { minimal_mode },
                lualine_b = { "filename" },
                lualine_c = { "branch", "diff", "diagnostics" },
                lualine_x = { function()
        local ok, pomo = pcall(require, "pomo")
        if not ok then
          return ""
        end

        local timer = pomo.get_first_to_finish()
        if timer == nil then
          return ""
        end

        return "󰄉 " .. tostring(timer)
      end},
                lualine_y = { "encoding", "filetype" },
                lualine_z = { current_time },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
        }
    end,
}
