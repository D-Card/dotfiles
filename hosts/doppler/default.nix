{profiles, ...}: {
  imports = with profiles; [
    core
    graphical
    rnl
    ssh-server
  ];

  # Networking
  networking = {
    hostId = "dca7d123"; # Randomly generated

    interfaces.enp4s0 = {
      wakeOnLan.enable = true;
      ipv4 = {
        addresses = [
          {
            address = "193.136.164.202";
            prefixLength = 27;
          }
        ];
        routes = [
          {
            address = "0.0.0.0";
            prefixLength = 0;
            via = "193.136.164.222";
          }
        ];
      };
      ipv6 = {
        addresses = [
          {
            address = "2001:690:2100:82::202";
            prefixLength = 64;
          }
        ];
        routes = [
          {
            address = "::";
            prefixLength = 0;
            via = "2001:690:2100:82::ffff:1";
          }
        ];
      };
    };
  };
}
