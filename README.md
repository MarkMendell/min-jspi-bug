This is a minimal example of a bug in Chromium dev tools when trying to debug a wasm file that uses JSPI and has a global struct variable. If you comment out the struct declaration, or call without JSPI, it works.

Prerequisites:

1. Enable `#enable-experimental-webassembly-stack-switching` in [chrome://flags](chrome://flags).
2. Install the [C/C++ DevTools Support (DWARF) extension](https://chrome.google.com/webstore/detail/cc%20%20-devtools-support-dwa/pdcpmagijalfljmkmjngeonclgbbannb).
3. In Dev Tools > <settings gear> > Experiments, enable WebAssembly Debugging: Enable DWARF support

Steps to reproduce:

1. Run `make` to create `foo.wasm`.
2. Serve the directory, e.g. `python3 -m http.server 8000`.
3. Visit the page in Chromium and set a breakpoint in the one instruction line of `foo.c` in `foo()`.
4. Refresh so that the page hits the breakpoint.
5. Hover your mouse over `argc` and notice that it shows the value, and you can inspect memory. This is the call without JSPI.
6. Press continue.
7. Hover your mouse over `argc` and notice that you can't see the value, and you can't inspect memory. This is the call with JSPI.
8. Click refresh and the page should crash.
