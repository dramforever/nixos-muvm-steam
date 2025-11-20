{
  bashInteractive,
  config,
  lib,
  muvm,
  path,
  writeShellApplication,
  writeShellScript,
}:

let
  pkgsx86_64 = import path {
    system = "x86_64-linux";
    inherit config;
  };

  inherit (pkgsx86_64) steam-run-free mesa;
  mesa32 = pkgsx86_64.pkgsi686Linux.mesa;

  initScript = writeShellScript "muvm-steam-init.sh" ''
    ln -snf ${mesa} /run/opengl-driver
    ln -snf ${mesa32} /run/opengl-driver-32
    ln -s ${lib.getExe steam-run-free} /run/steam-run-free
    echo 1 > /proc/sys/kernel/print-fatal-signals
    echo enable-shm=no > /run/pulse.conf
    echo "Run steam with:"
    echo "  PULSE_CLIENTCONFIG=/run/pulse.conf /run/steam-run-free /path/to/steam"
    echo
  '';
in

writeShellApplication {
  name = "muvm-steam-run-free";
  text = ''
    ${lib.getExe muvm} -x ${initScript} "''${SHELL:-${lib.getExe bashInteractive}}"
  '';
}
