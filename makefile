.POSIX:
foo.wasm: foo.o foo_jspi.o
	wasm-ld-15 --no-entry -export=foo_promising -export=foo -o foo.wasm foo.o foo_jspi.o
foo.o: foo.c
	clang-15 -g -DDEBUG -D_DEBUG -O0 -std=c99 -target wasm32 -nostdinc -D__EMSCRIPTEN__ -D_LIBCPP_ABI_VERSION=2 -fvisibility=hidden -fno-builtin -fno-exceptions -fno-inline -fno-threadsafe-statics -MMD -MP -MF foo.d -o foo.o -c foo.c
foo_jspi.o: foo_jspi.s
	clang-15 -g -target wasm32 -o foo_jspi.o -c foo_jspi.s
