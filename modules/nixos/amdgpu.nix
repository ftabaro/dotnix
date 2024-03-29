{ inputs, config, pkgs, ... }:

let
  baseConfig = import ./base.nix { inherit inputs config pkgs; };
in
{

  boot.kernelParams = baseConfig.boot.kernelParams ++ [ "video=2560x1440" ];

  environment.variables = {
    AMD_VULKAN_ICD = "RADV";
  };

  hardware = {
    opengl = {
      extraPackages = with pkgs; [
        rocm-opencl-icd
        amdvlk
      ];
      # To enable Vulkan support for 32-bit applications, also add:
      extraPackages32 = with pkgs.driversi686Linux; [
        amdvlk
      ];
    };
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
