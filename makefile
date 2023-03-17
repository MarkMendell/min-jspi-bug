.POSIX:
foo.wasm: foo.o foo_jspi.o
	wasm-ld --no-entry -export=foo_promising -export=foo -o foo.wasm foo.o foo_jspi.o
foo.o: foo.c
	clang -g -target wasm32 -o foo.o -c foo.c
foo_jspi.o: foo_jspi.s
	clang -g -target wasm32 -o foo_jspi.o -c foo_jspi.s
