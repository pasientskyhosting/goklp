all: linux32 linux64 darwin64

linux32:
		GOOS=linux GOARCH=386 go build -o bin/goklp32 goklp.go

linux64:
		GOOS=linux GOARCH=amd64 go build -o bin/goklp64 goklp.go

darwin64:
		GOOS=darwin GOARCH=amd64 go build -o bin/goklpOSX goklp.go
