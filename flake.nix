{
  description = "My NixOS personal config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    nixpkgs,
    unstable,
    ...
  } @ inputs: let
    lib = nixpkgs.lib.extend (self: super:
      import ./lib {
        inherit inputs profiles pkgs nixosConfigurations;
        lib = self;
      });

    overlays = lib.personal.mkOverlays ./overlays;
    pkgs = lib.personal.mkPkgs overlays;
    nixosConfigurations = lib.personal.mkHosts ./hosts;
    profiles = lib.personal.mkProfiles ./profiles;
  in {
    inherit nixosConfigurations overlays;

    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        # empty for now
      ];
    };

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
