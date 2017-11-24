all: linux32 linux64 darwin64 openbsd64 freebsd64 openbsd32 freebsd32

linux32:
		GOOS=linux GOARCH=386 go build -o bin/goklpLinux32 goklp.go

linux64:
		GOOS=linux GOARCH=amd64 go build -o bin/goklpLinux64 goklp.go

darwin64:
		GOOS=darwin GOARCH=amd64 go build -o bin/goklpOSX goklp.go

openbsd64:
		GOOS=openbsd GOARCH=amd64 go build -o bin/goklpOpenBSD64 goklp.go

freebsd64:
	  GOOS=freebsd GOARCH=amd64 go build -o bin/goklpFreeBSD64 goklp.go

openbsd32:
		GOOS=openbsd GOARCH=386 go build -o bin/goklpOpenBSD32 goklp.go

freebsd32:
	  GOOS=freebsd GOARCH=386 go build -o bin/goklpFreeBSD32 goklp.go
