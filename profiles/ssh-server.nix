{lib, ...}: {
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      # UseDNS = true;
      PermitRootLogin = "without-password";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
    authorizedKeysFiles = lib.mkForce ["/etc/ssh/authorized_keys.d/%u"];
  };
  users.users.dcard = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMCrf5FKQmZRA9ip4s/fOt1PVg+90k6tvEoDkCnPq1qL @oppenheimer"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOK0uyFwBEoBHuqXsrWZOAMROsDYGjzwEUmrAhz5jfr @schrodinger"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDHQiRYpOfTpddexkndt7d3Bw2wS/wLKKjs4526pJOdM @doppler"
    ];
  };
}
