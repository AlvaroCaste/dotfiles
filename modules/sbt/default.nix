{ pkgs, ... }:
{

  programs.sbt = {
    enable = true;
    plugins = [
      {
        org = "ch.epfl.scala";
        artifact = "sbt-bloop";
        version = "2.0.18";
      } # Bloop build server integration
      {
        org = "org.jmotor.sbt";
        artifact = "sbt-dependency-updates";
        version = "1.2.9";
      } # Dependency update checker
      {
        org = "io.spray";
        artifact = "sbt-revolver";
        version = "0.10.0";
      } # Fast restart for dev servers
      {
        org = "ch.epfl.scala";
        artifact = "sbt-scalafix";
        version = "0.14.5";
      } # Scalafix refactoring/linting
    ];
  };
}
