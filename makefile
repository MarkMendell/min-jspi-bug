.POSIX:
foo.wasm: foo.o foo_jspi.o
	wasm-ld-17 --no-entry -export=foo_promising -export=foo -o foo.wasm foo.o foo_jspi.o
foo.o: foo.c
	clang-17 -g -target wasm32 -o foo.o -c foo.c
foo_jspi.o: foo_jspi.s
	clang-17 -g -target wasm32 -o foo_jspi.o -c foo_jspi.s
