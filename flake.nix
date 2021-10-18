{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    test-runner.url = github:mschwaig/sysprog21-automation;
  };

  outputs = { self, nixpkgs, test-runner }:
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    assignmentlib = test-runner.lib.mkAssignment {
      binary-name = "sum";
      src-name = "sum.c";
      ref-impl = ./ref-impl;
      ref-data = ./ref-data;
      config = ./config;
    };
  in {
    assignments = assignmentlib.ingest {
      # in a more realistic example student data would not be checked in with the assignment
      # but come from another data source
      moodle-zip = ./moodle-sum-assignment-submissions.zip;
      split = [
        { name="idle_tutor"; share=1; }
        { name="busy_tutor"; share=9; }
      ];
      seed = "thisdoesnotworkwell-needtosplitassignmentsanotherway";
    };

    apps."x86_64-linux".server = assignmentlib.server;

    defaultPackage."x86_64-linux" = self.assignments;
  };
}
