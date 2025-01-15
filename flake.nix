{

description = "Flake init";

inputs = {
  nixpkgs = {
   url = "github:NixOS/nixpkgs/nixos-24.11";

  };
  
  # To enable unstable packages uncomment this and comment out original
  # nixpkgs = {
   # url = "nixpkgs/nixos-unstable";

  # };


};

outputs = {self,nixpkgs, ...}:
 let lib = nixpkgs.lib;

in {
 
 nixosConfigurations = {
  Daniel = lib.nixosSystem { # Change to own name upon install
	system = "x86_64-linux";
	modules = [./configuration.nix];
  };

 };


};

}
