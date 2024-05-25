{...}: {
  security = {
    # Unable swaylock use finger print
    # i had problems to login without this.
    pam.services.swaylock.fprintAuth = false;
  };
}
