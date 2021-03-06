local M = {}

M.config = function()

     defaults = {
                file_sorter = require("telescope.sorters").get_fzy_sorter,
                propmpt_prefix = " >",
                color_devicons = true,

                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            }
            extensions = {
                fzy_native = {
                    override_generic_sorter = true,
                    override_file_sorter = true
                }
            }
            require("telescope").load_extension("fzy_native")
end

return M
