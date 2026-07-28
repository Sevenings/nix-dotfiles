{ lib, ... }:

{
  options = {
    userSettings = {
      username = lib.mkOption {
        default = "";
        description = "Username";
        type = lib.types.str;
      };

      fullname = lib.mkOption {
        default = "";
        description = "User full name";
        type = lib.types.str;
      };

      email = lib.mkOption {
        default = "";
        description = "User email";
        type = lib.types.str;
      };

      uid = lib.mkOption {
        default = 1000;
        description = "User UID";
        type = lib.types.int;
      };
    };
  };
}
