{ pkgs ? import <nixpkgs> {} }:
pkgs.python312Packages.buildPythonApplication {
  pname = "horario-ponto";
  version = "0.1.0";
  format = "pyproject";
  src = ./.;

  nativeBuildInputs = with pkgs.python312Packages; [
    setuptools
    wheel
  ];

  propagatedBuildInputs = with pkgs.python312Packages; [
    requests
    beautifulsoup4
  ];
}
