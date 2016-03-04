Godep
=====
[**Godep**](https://github.com/tools/godep) is an dependency management tool in [Go](#go).

It helps avoid dependency issues and it is especially helpful while deploying a Go project to production.

To install Godep, you need to install `go` first, then you can get `godep` by:
```sh
go get github.com/tools/godep
```

To use `godep`, navigate to the root directory of your Go project and then execute: `godep save -r`.

`-r` is for re-directing your dependencies to the ones that managed by `godep`.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
