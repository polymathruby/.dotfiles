-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "go to previous diagnostic" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "go to next diagnostic" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "show line diagnostics" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "open diagnostic quickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
--close NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Buffer menu
vim.keymap.set("n", "<leader><TAB>", "<cmd>:b#<CR>", { desc = "switch to last buffer" })
vim.keymap.set("n", "<leader>be", "<cmd>:enew<CR>", { desc = "open empty buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>:bd<CR>", { desc = "delete buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>:bd!<CR>", { desc = "force delete buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>:bn<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>:bp<CR>", { desc = "previous buffer" })

-- Debug menu

-- Error menu
vim.keymap.set("n", "<leader>en", "<cmd>silent cc | silent cn<cr>zz", { desc = "jump to next issue" })
vim.keymap.set("n", "<leader>ep", "<cmd>silent cc | silent cp<cr>zz", { desc = "jump to previous issue" })

-- Files menu
vim.keymap.set("n", "<leader>fs", "<cmd>w<CR>", { desc = "save file" })
vim.keymap.set("n", "<leader>fr", ":e<CR>:bd#<CR>:e<CR>", { desc = "reload file" })

-- Git menu
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<CR>", { desc = "git blame" })
vim.keymap.set("n", "<leader>gl", "<cmd>Gitsigns blame_line<CR>", { desc = "git blame line" })

-- Help menu
vim.api.nvim_set_keymap(
	"n",
	"<leader>Hm",
	":redir @a<CR>:messages<CR>:redir END<CR>:new<CR>:put a<CR>",
	{ desc = "messages buffer" }
)

vim.keymap.set("n", "<leader>HM", "<cmd>Mason<CR>", { desc = "open Mason" })

-- Quit menu
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "quit nVim" })
vim.keymap.set("n", "<leader>qQ", "<cmd>q!<CR>", { desc = "force quit nVim" })

-- Utilities menu

-- Search menu
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<leader>sc", "<cmd>nohlsearch<CR>", { desc = "clear search highlights" })

-- Toggle menu
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "toggle line wrapping" })

-- Windows menu

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<leader>wh", "<C-w><C-h>", { desc = "move focus to the left window" })
vim.keymap.set("n", "<leader>wl", "<C-w><C-l>", { desc = "move focus to the right window" })
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>", { desc = "move focus to the lower window" })
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>", { desc = "move focus to the upper window" })

vim.keymap.set("n", "<leader>ws", "<cmd>:split<CR>", { desc = "horizontal split" })
vim.keymap.set("n", "<leader>wv", "<cmd>:vsplit<CR>", { desc = "vertical split" })

vim.keymap.set("n", "<leader>wd", "<cmd>:q<CR>", { desc = "delete current window" })
vim.keymap.set("n", "<leader>wo", "<cmd>:only<CR>", { desc = "close all windows except current" })

function ToggleSplits()
	-- Get the current window layout (width and height)
	local width = vim.api.nvim_win_get_width(0)
	local height = vim.api.nvim_win_get_height(0)

	-- If the current window is wider than it is tall, it's a horizontal split
	if width > height then
		-- Convert horizontal splits to vertical by using :wincmd L (Move to the left)
		vim.cmd("wincmd H")
	else
		-- Convert vertical splits to horizontal by using :wincmd H (Move down)
		vim.cmd("wincmd J")
	end
end

-- Bind the function to a key, e.g., <leader>t
vim.keymap.set("n", "<leader>wc", ":lua ToggleSplits()<CR>", { desc = "change orientation" })

-- quality of life keymaps
-- vertical scroll & center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search & center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- don't yank x or visual paste
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "p", '"_dP')

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
