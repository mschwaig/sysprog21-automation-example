## run the tests for all assignments and assign them to tutors

```
nix build
```

This can now be handed out to tutors.

Later the (WIP) function currently called `egress` is meant for collecting results for upload.

## start live-feedback server

First run

```
nix run .#server
```

Now you can use the `live-feedback/index.html` file from `sysprog21-automation` to upload code to the go service.

