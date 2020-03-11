cmd_Release/obj.target/native/src/scan.o := cc '-DNODE_GYP_MODULE_NAME=native' '-DUSING_UV_SHARED=1' '-DUSING_V8_SHARED=1' '-DV8_DEPRECATION_WARNINGS=1' '-DV8_DEPRECATION_WARNINGS' '-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D_LARGEFILE_SOURCE' '-D_FILE_OFFSET_BITS=64' '-D__STDC_FORMAT_MACROS' '-DOPENSSL_NO_PINSHARED' '-DOPENSSL_THREADS' '-DBUILDING_NODE_EXTENSION' -I/home/pi/.cache/node-gyp/12.16.1/include/node -I/home/pi/.cache/node-gyp/12.16.1/src -I/home/pi/.cache/node-gyp/12.16.1/deps/openssl/config -I/home/pi/.cache/node-gyp/12.16.1/deps/openssl/openssl/include -I/home/pi/.cache/node-gyp/12.16.1/deps/uv/include -I/home/pi/.cache/node-gyp/12.16.1/deps/zlib -I/home/pi/.cache/node-gyp/12.16.1/deps/v8/include -I/usr/local/include/libmongoc-1.0 -I/usr/local/include/libbson-1.0/bson -I/usr/local/include/libbson-1.0  -fPIC -pthread -Wall -Wextra -Wno-unused-parameter -O3 -fno-omit-frame-pointer  -MMD -MF ./Release/.deps/Release/obj.target/native/src/scan.o.d.raw   -c -o Release/obj.target/native/src/scan.o ../src/scan.c
Release/obj.target/native/src/scan.o: ../src/scan.c \
 /home/pi/.cache/node-gyp/12.16.1/include/node/node_api.h \
 /home/pi/.cache/node-gyp/12.16.1/include/node/js_native_api.h \
 /home/pi/.cache/node-gyp/12.16.1/include/node/js_native_api_types.h \
 /home/pi/.cache/node-gyp/12.16.1/include/node/node_api_types.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc.h \
 /usr/local/include/libbson-1.0/bson/bson.h \
 /usr/local/include/libbson-1.0/bson/bson-compat.h \
 /usr/local/include/libbson-1.0/bson/bson-prelude.h \
 /usr/local/include/libbson-1.0/bson/bson-config.h \
 /usr/local/include/libbson-1.0/bson/bson-macros.h \
 /usr/local/include/libbson-1.0/bson/bson-atomic.h \
 /usr/local/include/libbson-1.0/bson/bson-context.h \
 /usr/local/include/libbson-1.0/bson/bson-types.h \
 /usr/local/include/libbson-1.0/bson/bson-endian.h \
 /usr/local/include/libbson-1.0/bson/bson-clock.h \
 /usr/local/include/libbson-1.0/bson/bson-decimal128.h \
 /usr/local/include/libbson-1.0/bson/bson-error.h \
 /usr/local/include/libbson-1.0/bson/bson-iter.h \
 /usr/local/include/libbson-1.0/bson/bson-json.h \
 /usr/local/include/libbson-1.0/bson/bson-keys.h \
 /usr/local/include/libbson-1.0/bson/bson-md5.h \
 /usr/local/include/libbson-1.0/bson/bson-memory.h \
 /usr/local/include/libbson-1.0/bson/bson-oid.h \
 /usr/local/include/libbson-1.0/bson/bson-reader.h \
 /usr/local/include/libbson-1.0/bson/bson-string.h \
 /usr/local/include/libbson-1.0/bson/bson-utf8.h \
 /usr/local/include/libbson-1.0/bson/bson-value.h \
 /usr/local/include/libbson-1.0/bson/bson-version.h \
 /usr/local/include/libbson-1.0/bson/bson-version-functions.h \
 /usr/local/include/libbson-1.0/bson/bson-writer.h \
 /usr/local/include/libbson-1.0/bson/bcon.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-macros.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-prelude.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-apm.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-host-list.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-server-description.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-read-prefs.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-config.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-topology-description.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-bulk-operation.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-write-concern.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-change-stream.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-client.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-collection.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-flags.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-cursor.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-index.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-read-concern.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-find-and-modify.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-database.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-gridfs.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-stream.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-iovec.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-socket.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-gridfs-file.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-gridfs-file-list.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-ssl.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-uri.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-client-pool.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-error.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-gridfs-bucket.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-gridfs-file-page.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-init.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-matcher.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-handshake.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-opcode.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-log.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-client-session.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-stream-buffered.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-stream-file.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-stream-gridfs.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-stream-socket.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-version.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-version-functions.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-rand.h \
 /usr/local/include/libmongoc-1.0/mongoc/mongoc-stream-tls.h
../src/scan.c:
/home/pi/.cache/node-gyp/12.16.1/include/node/node_api.h:
/home/pi/.cache/node-gyp/12.16.1/include/node/js_native_api.h:
/home/pi/.cache/node-gyp/12.16.1/include/node/js_native_api_types.h:
/home/pi/.cache/node-gyp/12.16.1/include/node/node_api_types.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc.h:
/usr/local/include/libbson-1.0/bson/bson.h:
/usr/local/include/libbson-1.0/bson/bson-compat.h:
/usr/local/include/libbson-1.0/bson/bson-prelude.h:
/usr/local/include/libbson-1.0/bson/bson-config.h:
/usr/local/include/libbson-1.0/bson/bson-macros.h:
/usr/local/include/libbson-1.0/bson/bson-atomic.h:
/usr/local/include/libbson-1.0/bson/bson-context.h:
/usr/local/include/libbson-1.0/bson/bson-types.h:
/usr/local/include/libbson-1.0/bson/bson-endian.h:
/usr/local/include/libbson-1.0/bson/bson-clock.h:
/usr/local/include/libbson-1.0/bson/bson-decimal128.h:
/usr/local/include/libbson-1.0/bson/bson-error.h:
/usr/local/include/libbson-1.0/bson/bson-iter.h:
/usr/local/include/libbson-1.0/bson/bson-json.h:
/usr/local/include/libbson-1.0/bson/bson-keys.h:
/usr/local/include/libbson-1.0/bson/bson-md5.h:
/usr/local/include/libbson-1.0/bson/bson-memory.h:
/usr/local/include/libbson-1.0/bson/bson-oid.h:
/usr/local/include/libbson-1.0/bson/bson-reader.h:
/usr/local/include/libbson-1.0/bson/bson-string.h:
/usr/local/include/libbson-1.0/bson/bson-utf8.h:
/usr/local/include/libbson-1.0/bson/bson-value.h:
/usr/local/include/libbson-1.0/bson/bson-version.h:
/usr/local/include/libbson-1.0/bson/bson-version-functions.h:
/usr/local/include/libbson-1.0/bson/bson-writer.h:
/usr/local/include/libbson-1.0/bson/bcon.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-macros.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-prelude.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-apm.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-host-list.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-server-description.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-read-prefs.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-config.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-topology-description.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-bulk-operation.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-write-concern.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-change-stream.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-client.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-collection.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-flags.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-cursor.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-index.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-read-concern.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-find-and-modify.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-database.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-gridfs.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-stream.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-iovec.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-socket.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-gridfs-file.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-gridfs-file-list.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-ssl.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-uri.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-client-pool.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-error.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-gridfs-bucket.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-gridfs-file-page.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-init.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-matcher.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-handshake.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-opcode.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-log.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-client-session.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-stream-buffered.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-stream-file.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-stream-gridfs.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-stream-socket.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-version.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-version-functions.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-rand.h:
/usr/local/include/libmongoc-1.0/mongoc/mongoc-stream-tls.h:
