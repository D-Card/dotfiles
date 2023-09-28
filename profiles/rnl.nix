{pkgs, ...}: let
  RNLCert = builtins.fetchurl {
    url = "https://rnl.tecnico.ulisboa.pt/ca/cacert/cacert.pem";
    sha256 = "Qg7e7LIdFXvyh8dbEKLKdyRTwFaKSG0qoNN4KveyGwg=";
  };
in {
  environment = {
    systemPackages = with pkgs; [
      # empty for now
    ];
  };

  # Base network
  networking = {
    domain = "rnl.tecnico.ulisboa.pt";
    firewall.enable = true;
    useDHCP = false;
    nameservers = ["193.136.164.1" "193.136.164.2" "2001:690:2100:82::1" "2001:690:2100:82::2"];
    search = ["rnl.tecnico.ulisboa.pt"];
  };

  # Configure NTP
  networking.timeServers = ["ntp.rnl.tecnico.ulisboa.pt"];

  # Add certificates
  security.pki.certificateFiles = ["${RNLCert}"];
}
