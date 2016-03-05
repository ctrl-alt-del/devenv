Godep
=====
[**Godep**](https://github.com/tools/godep) is an dependency management tool in [Go](#go).

It manages dependency and avoid related issues; it is very helpful especially while deploying a Go project to production.

To install `godep`, you need to install `go` first; once you have `go`, you can get `godep` by:
```sh
go get github.com/tools/godep
```

To use `godep`, navigate to the root directory of your Go project and then execute: `godep save -r`.

`-r` is for re-directing your dependencies to the ones that managed by `godep`.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
