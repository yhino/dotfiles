return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
        ft = { 'markdown' },
        opts = {
            heading = {
                width = 'full',
                icons = {},
            },
        },
    },
    {
        'hedyhli/markdown-toc.nvim',
        ft = { 'markdown' },
        cmd = { 'Mtoc' },
        opts = {},
    },
}
