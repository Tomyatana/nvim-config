return {
    {
        "eandrju/cellular-automaton.nvim",
        lazy = false
    },
    {
        "Tomyatana/nvim-gf-fix",
        config = function ()
            require("nvim-gf-fix").setup({})
        end
    }
}
