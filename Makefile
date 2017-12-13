all: clean linux64 darwin64 openbsd64 freebsd64 mips64

clean:
		/bin/rm -rf bin/*

linux64:
		GOOS=linux GOARCH=amd64 go build -o bin/goklp_Linux_x86_64 goklp.go

darwin64:
		GOOS=darwin GOARCH=amd64 go build -o bin/goklp_Darwin_x86_64 goklp.go

openbsd64:
		GOOS=openbsd GOARCH=amd64 go build -o bin/goklp_OpenBSD_amd64 goklp.go

freebsd64:
	  GOOS=freebsd GOARCH=amd64 go build -o bin/goklp_FreeBSD_amd64 goklp.go

mips64:
	  GOOS=linux GOARCH=mips64 go build -o bin/goklp_Linux_mips64 goklp.go
