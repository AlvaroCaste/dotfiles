{ pkgs, ... }:
{

  programs.sbt = {
    enable = true;
    package = (pkgs.sbt.override { jre = pkgs.jdk11; });
    plugins = [
      {
        org = "ch.epfl.scala";
        artifact = "sbt-bloop";
        version = "1.4.11";
      }
      {
        org = "org.jmotor.sbt";
        artifact = "sbt-dependency-updates";
        version = "1.2.2";
      }
      {
        org = "io.spray";
        artifact = "sbt-revolver";
        version = "0.9.1";
      }
      {
        org = "ch.epfl.scala";
        artifact = "sbt-scalafix";
        version = "0.9.34";
      }
    ];
  };

  home.file.".sbt/1.0/credentials.sbt".text =
    ''
      credentials += Credentials(Path.userHome / ".secrets" / "credentials")
      credentials += Credentials(Path.userHome / ".secrets" / "old_credentials")
    '';
}
