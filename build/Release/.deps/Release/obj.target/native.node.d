cmd_Release/obj.target/native.node := g++ -shared -pthread -rdynamic  -Wl,-soname=native.node -o Release/obj.target/native.node -Wl,--start-group Release/obj.target/native/src/scan.o -Wl,--end-group /usr/lib/arm-linux-gnueabihf/libbluetooth.a /usr/local/lib/libbson-1.0.so /usr/local/lib/libmongoc-1.0.so
