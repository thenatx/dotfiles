{
  enable = true;

  settings = {
    mapping = {
      __raw = ''
        cmp.mapping.preset.insert({
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-e>'] = cmp.mapping.abort(),

          ['<C-f>'] = cmp.mapping.scroll_docs(-4),

          ['<C-g>'] = cmp.mapping.scroll_docs(4),

          ['<C-Space>'] = cmp.mapping.complete(),

          ['<CR>'] = cmp.mapping.confirm({ select = true }),

          ['<S-CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        })
      '';
    };

    snippet = {
      expand = "function(args) require('luasnip').lsp_expand(args.body) end";
    };

    sources = {
      __raw = ''
        cmp.config.sources({
          {name = 'nvim_lsp'},
          {name = 'path'},
          {name = 'luasnip'},
          {name = 'cmdline'},
          }, {
        {name = 'buffer'},
        })
      '';
    };

    window = {
      completion.border = "rounded";
      documentation.border = "rounded";
    };
  };
}
