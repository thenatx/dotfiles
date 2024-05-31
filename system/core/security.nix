{...}: {
  security = {
    pam.services = {
      hyprlock.fprintAuth = false;
    };
  };
}
