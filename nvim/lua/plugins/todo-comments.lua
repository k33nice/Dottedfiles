require 'todo-comments'.setup{
    signs = false,
    highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "fg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)]], -- pattern used for highlightng (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
    },
    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
        },
        pattern = [[(KEYWORDS)(:|\()]], -- ripgrep regex
    },
}
