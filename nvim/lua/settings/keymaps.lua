vim.keymap.set("n","<leader>sv","<C-w>v") --split vertical
vim.keymap.set("n","<leader>sh","<C-w>s") --split horitzon
vim.keymap.set("n","<leader>se","<C-w>=") --make split windows equal width
vim.keymap.set("n","<leader>sx",":close<CR>") --close current split
vim.keymap.set("n","<leader>to",":tabnew<CR>") --open new tab
vim.keymap.set("n","<leader>tx",":tabclose<CR>") --close current tab
vim.keymap.set("n","<leader>tn",":tabn<CR>") --go to next tab
vim.keymap.set("n","<leader>tp",":tabp<CR>") --go to previouse tab

vim.keymap.set("n", "<C-d>","<C-d>zz")
vim.keymap.set("n", "<C-u>","<C-u>zz")

vim.keymap.set("n", "n" ,"nzzzv")
vim.keymap.set("n", "N" , "Nzzzv")

vim.keymap.set("x","<leader>p","\"_dP")

vim.keymap.set("n","<leader>y","\"+y")
vim.keymap.set("v","<leader>y","\"+y")
vim.keymap.set("n","<leader>Y","\"+Y")

vim.keymap.set("n","<leader>d","\"_d")
vim.keymap.set("v","<leader>d","\"_d")

vim.keymap.set("n","-","<CMD>Oil<CR>")

