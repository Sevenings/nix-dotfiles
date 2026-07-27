{ lib, ... }:

{
  options.systemSettings.username = lib.mkOption {
    default = "";
    description = "Primary system username";
    type = lib.types.str;
  };
}
