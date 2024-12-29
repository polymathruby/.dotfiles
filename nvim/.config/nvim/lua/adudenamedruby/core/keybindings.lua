-- Keymappings

-- Aerial
WKMap("ta", "<cmd>AerialToggle!<CR>", "aerial")

-- Code menu
WKMapGroup("c", "code")

-- Conform
WKMap("uf", function()
    require("conform").format({
        async = true,
        lsp_fallback = true,
        timeout_ms = 500,
    })
end, "format buffer")

-- Buffer menu
WKMapGroup("b", "buffers")
WKMap("<TAB>", "<cmd>:b#<CR>", "switch to last buffer")
WKMap("be", "<cmd>:enew<CR>", "open empty buffer")
WKMap("bd", "<cmd>:bd<CR>", "delete buffer")
WKMap("bD", "<cmd>:bd!<CR>", "force delete buffer")
WKMap("bo", "<cmd>:bd!# | e#<CR>", "force delete buffer")
WKMap("bn", "<cmd>:bn<CR>", "next buffer")
WKMap("bp", "<cmd>:bp<CR>", "previous buffer")
WKMap("br", ":e<CR>:bd#<CR>:e<CR>", "reload buffer with file")

-- Debug menu
WKMapGroup("d", "debug")
-- There are sereval keymaps in nvim-dap for the debugger
WKMap("dp", vim.diagnostic.goto_prev, "go to previous diagnostic")
WKMap("dn", vim.diagnostic.goto_next, "go to next diagnostic")
WKMap("dl", vim.diagnostic.open_float, "show line diagnostics")
WKMap("dq", vim.diagnostic.setloclist, "open diagnostic quickfix list")

-- Error menu
WKMapGroup("e", "errors")
WKMap("en", "<cmd>silent cc | silent cn<cr>zz", "jump to next issue")
WKMap("ep", "<cmd>silent cc | silent cp<cr>zz", "jump to previous issue")

-- Files menu
WKMapGroup("f", "files")
WKMap("fs", "<cmd>w<CR>", "save file")

-- flash
local flash = require("flash")

WKMap("j", function()
    flash.jump()
end, "jump", { "n", "x", "o" })
WKMap("us", function()
    flash.treesitter()
end, "select with treesitter")

-- Git menu
WKMapGroup("g", "git")
WKMap("gb", "<cmd>Gitsigns blame<CR>", "git blame")
WKMap("gl", "<cmd>Gitsigns blame_line<CR>", "git blame line")
WKMap("gd", "<cmd>DiffviewOpen<CR>", "diffView open")
WKMap("gD", "<cmd>DiffviewClose<CR>", "diffView close")
WKMap("gh", "<cmd>DiffviewFileHistory<CR>", "diffView fileHistory")

WKMap("gs", function()
    require("telescope").extensions.git_worktree.git_worktrees()
end, "switch worktree")
WKMap("gc", function()
    require("telescope").extensions.git_worktree.create_git_worktree()
end, "create worktree")

-- Harpoon menu
local harpoon = require("harpoon")

WKMapGroup("h", "harpoon")
WKMap("ha", "", "add to harpoon")
WKMap("haa", function()
    harpoon:list():add()
end, "add to harpoon")
WKMap("hah", function()
    harpoon:list():replace_at(1)
end, "add to h")
WKMap("hat", function()
    harpoon:list():replace_at(2)
end, "add to t")
WKMap("han", function()
    harpoon:list():replace_at(3)
end, "add to n")
WKMap("has", function()
    harpoon:list():replace_at(4)
end, "add to s")

WKMap("hr", "", "remove")
WKMap("hrr", function()
    harpoon:list():remove()
end, "remove current file")
WKMap("hrc", function()
    harpoon:list():clear()
end, "clear harpoon")
WKMap("hrh", function()
    harpoon:list():remove_at(1)
end, "clear h")
WKMap("hrt", function()
    harpoon:list():remove_at(2)
end, "clear t")
WKMap("hrn", function()
    harpoon:list():remove_at(3)
end, "clear n")
WKMap("hrs", function()
    harpoon:list():remove_at(4)
end, "clear s")

WKMap("hv", function()
    -- toggle_telescope(harpoon:list())
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, "open harpoon list")

WKMap("hh", function()
    harpoon:list():select(1)
end, "go to h")
WKMap("ht", function()
    harpoon:list():select(2)
end, "go to t")
WKMap("hn", function()
    harpoon:list():select(3)
end, "go to n")
WKMap("hs", function()
    harpoon:list():select(4)
end, "go to s")

-- Help menu
WKMapGroup("H", "Help")
WKMap("Hm", ":redir @a<CR>:messages<CR>:redir END<CR>:new<CR>:put a<CR>", "messages buffer")
WKMap("HM", "<cmd>Mason<CR>", "open Mason")

-- Indent Mode
KMap("<", "<gv", "", "v")
KMap(">", ">gv", "", "v")

-- LSP menu
WKMapGroup("l", "LSP")
-- many lsp functions are actually in nvim-lsp because they need to be
-- in the local LSP callback

-- Marks: Saner mark movement to save keystrokes
KMap("'", "`", "")
KMap("`", "'", "")

-- Move Lines
KMap("<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", "Move Down")
KMap("<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", "Move Up")
KMap("<A-j>", "<esc><cmd>m .+1<cr>==gi", "Move Down", "i")
KMap("<A-k>", "<esc><cmd>m .-2<cr>==gi", "Move Up", "i")
KMap("<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", "Move Down", "v")
KMap("<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", "Move Up", "v")

-- Quickfix Menu
WKMapGroup("x", "quickfix")
WKMap("xn", "<cmd>cnext<CR>zz", "quickfix list next")
WKMap("xp", "<cmd>cprev<CR>zz", "quickfix list previous")
WKMap("xN", "<cmd>lnext<CR>zz", "loclist next")
WKMap("xP", "<cmd>lprev<CR>zz", "loclist previous")
WKMap("xo", "<cmd>copen<CR>", "open quickfix list")
WKMap("xc", "<cmd>cclose<CR>", "close quickfix list")
WKMap("xO", "<cmd>lopen<CR>", "open loclist")
WKMap("xC", "<cmd>lclose<CR>", "close loclist")

-- Quit menu
WKMapGroup("q", "quit")
KMap("<leader>qq", "<cmd>qa!<CR>", "quit nVim")

-- Quality of Life bindings
-- vertical scroll & center
KMap("<C-d>", "<C-d>zz")
KMap("<C-u>", "<C-u>zz")

-- treesitter
WKMap("uI", "<cmd>InspectTree<cr>", "Inspect Tree")

-- Toggle menu
WKMapGroup("t", "toggle")
WKMap("tw", "<cmd>set wrap!<CR>", "toggle line wrapping")

-- Search: behaviour of n and N
KMap("n", "'Nn'[v:searchforward].'zzzv'", "Next Search Result", "n", true)
KMap("n", "'Nn'[v:searchforward]", "Next Search Result", "x", true)
KMap("n", "'Nn'[v:searchforward]", "Next Search Result", "o", true)
KMap("N", "'nN'[v:searchforward].'zzzv'", "Prev Search Result", "n", true)
KMap("N", "'nN'[v:searchforward]", "Prev Search Result", "x", true)
KMap("N", "'nN'[v:searchforward]", "Prev Search Result", "o", true)

-- Search menu
WKMapGroup("s", "search")
-- Clear highlights on search when pressing <Esc> in normal mode
WKMap("sc", "<cmd>nohlsearch<CR>", "clear search highlights")

-- Utilites menu
WKMapGroup("u", "utilities")

-- Utilities: Duck
local duck = require("duck")

KMap("<leader>uD", "", "Duck")
WKMap("uDd", function()
    duck.hatch()
end, "summon duck")
WKMap("uDc", function()
    duck.cook()
end, "cook duck")
WKMap("uDa", function()
    duck.cook_all()
end, "cook all ducks")

-- Utilities: Linter
WKMap("ul", function()
    require("lint").try_lint()
end, "lint file")

-- Visual Line movement
KMap("j", "gj")
KMap("k", "gk")

-- Window movement
KMap("c-h", "<cmd>wincmd h<CR>", "move focus to the left window")
KMap("c-l", "<cmd>wincmd l<CR>", "move focus to the right window")
KMap("c-j", "<cmd>wincmd j<CR>", "move focus to the lower window")
KMap("c-k", "<cmd>wincmd k<CR>", "move focus to the upper window")

-- Windows menu
WKMapGroup("w", "windows")
WKMap("ws", "<cmd>:split<CR>", "horizontal split")
WKMap("wv", "<cmd>:vsplit<CR>", "vertical split")
WKMap("wd", "<cmd>:q<CR>", "delete current window")
WKMap("wo", "<cmd>:only<CR>", "close all windows except current")

-- Resize windowswith arrows
KMap("<C-Up>", ":resize +2<CR>")
KMap("<C-Down>", ":resize -2<CR>")
KMap("<C-Left>", ":vertical resize +2<CR>")
KMap("<C-Right>", ":vertical resize -2<CR>")

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

WKMap("wc", ":lua ToggleSplits()<CR>", "change orientation")

-- Yanking
-- don't yank x or visual paste
KMap("x", '"_x')
KMap("p", '"_dP', "", "v")
