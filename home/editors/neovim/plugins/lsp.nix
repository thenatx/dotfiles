{
  enable = true;

  servers = {
    html.enable = true;

    cssls.enable = true;

    ts_ls.enable = true;

    rust_analyzer = {
      enable = true;
      # This two options will make cargo and rustc not installed automatically
      # you should use devshells instead but can set it to true to install both and no install via 'home.packages'
      installCargo = false;
      installRustc = false;
    };

    volar.enable = true;

    nil_ls.enable = true;

    bashls = {
      enable = true;
    };
  };
}
