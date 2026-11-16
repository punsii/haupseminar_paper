{
  description = "Hauptseminar paper: real-time 3D Gaussian Splatting";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      treefmt-nix,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      treefmtEval = treefmt-nix.lib.evalModule pkgs {
        projectRootFile = "flake.nix";

        programs.typstyle.enable = true;
        programs.nixfmt.enable = true;
      };

      fonts = with pkgs; [
        dejavu_fonts
        liberation_ttf
        newcomputermodern
      ];
      fontPaths = pkgs.lib.concatMapStringsSep ":" (f: "${f}/share/fonts") fonts;
      typst = pkgs.typst.withPackages (p: [ p.supercharged-hm ]);
    in
    {
      formatter.${system} = treefmtEval.config.build.wrapper;
      checks.${system}.treefmt = treefmtEval.config.build.check self;
      packages.${system}.default = pkgs.stdenvNoCC.mkDerivation {
        name = "rt3dgs-paper";
        src = ./.;
        nativeBuildInputs = [ typst ];
        TYPST_FONT_PATHS = fontPaths;
        buildPhase = "typst compile paper.typ paper.pdf";
        installPhase = "install -Dm644 paper.pdf $out/paper.pdf";
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.typst
          pkgs.tinymist
          pkgs.typstyle
          treefmtEval.config.build.wrapper
        ];
        TYPST_FONT_PATHS = fontPaths;
      };
    };
}
