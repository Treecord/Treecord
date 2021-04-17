{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    jdk8
    androidenv.androidPkgs_9_0.platform-tools
  ];
}
