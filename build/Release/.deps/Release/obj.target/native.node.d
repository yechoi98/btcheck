cmd_Release/obj.target/native.node := g++ -shared -pthread -rdynamic  -Wl,-soname=native.node -o Release/obj.target/native.node -Wl,--start-group Release/obj.target/native/src/scan.o -Wl,--end-group 
