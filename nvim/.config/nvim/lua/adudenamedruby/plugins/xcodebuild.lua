local progress_handle

return {
	"wojciech-kulik/xcodebuild.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("xcodebuild").setup({
			show_build_progress_bar = false,
			logs = {
				auto_open_on_success_tests = false,
				auto_open_on_failed_tests = false,
				auto_open_on_success_build = false,
				auto_open_on_failed_build = false,
				auto_focus = false,
				auto_close_on_app_launch = true,
				only_summary = true,
				notify = function(message, severity)
					local fidget = require("fidget")
					if progress_handle then
						progress_handle.message = message
						if not message:find("Loading") then
							progress_handle:finish()
							progress_handle = nil
							if vim.trim(message) ~= "" then
								fidget.notify(message, severity)
							end
						end
					else
						fidget.notify(message, severity)
					end
				end,
				notify_progress = function(message)
					local progress = require("fidget.progress")

					if progress_handle then
						progress_handle.title = ""
						progress_handle.message = message
					else
						progress_handle = progress.handle.create({
							message = message,
							lsp_client = { name = "xcodebuild.nvim" },
						})
					end
				end,
			},
			code_coverage = {
				enabled = true,
			},
		})

    -- stylua: ignore start
    vim.keymap.set("n", "<leader>xB", "<cmd>XcodebuildPicker<cr>", { desc = "show Xcodebuild actions" })
    vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildProjectManager<cr>", { desc = "show project manager actions" })

    vim.keymap.set("n", "<leader>cb", "<cmd>XcodebuildBuild<cr>", { desc = "build project" })
    vim.keymap.set("n", "<leader>cB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "build for testing" })
    vim.keymap.set("n", "<leader>cr", "<cmd>XcodebuildBuildRun<cr>", { desc = "build & run project" })

    vim.keymap.set("n", "<leader>ct", "<cmd>XcodebuildTest<cr>", { desc = "run tests" })
    vim.keymap.set("v", "<leader>ct", "<cmd>XcodebuildTestSelected<cr>", { desc = "run selected tests" })
    vim.keymap.set("n", "<leader>cT", "<cmd>XcodebuildTestClass<cr>", { desc = "run this test class" })

    vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "toggle Xcodebuild logs" })
    vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "toggle code coverage" })
    vim.keymap.set("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "show code coverage report" })
    vim.keymap.set("n", "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "toggle test explorer" })
    vim.keymap.set("n", "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "show failing snapshots" })

    vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "select device" })
    vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "select test plan" })
    vim.keymap.set("n", "<leader>cq", "<cmd>Telescope quickfix<cr>", { desc = "show quickFix list" })

    vim.keymap.set("n", "<leader>cx", "<cmd>XcodebuildQuickfixLine<cr>", { desc = "quickfix line" })
    vim.keymap.set("n", "<leader>ca", "<cmd>XcodebuildCodeActions<cr>", { desc = "show code actions" })
	end,
}
