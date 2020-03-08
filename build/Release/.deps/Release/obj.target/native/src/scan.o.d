cmd_Release/obj.target/native/src/scan.o := cc '-DNODE_GYP_MODULE_NAME=native' '-DUSING_UV_SHARED=1' '-DUSING_V8_SHARED=1' '-DV8_DEPRECATION_WARNINGS=1' '-DV8_DEPRECATION_WARNINGS' '-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D_LARGEFILE_SOURCE' '-D_FILE_OFFSET_BITS=64' '-D__STDC_FORMAT_MACROS' '-DOPENSSL_NO_PINSHARED' '-DOPENSSL_THREADS' '-DBUILDING_NODE_EXTENSION' -I/home/pi/.cache/node-gyp/12.16.1/include/node -I/home/pi/.cache/node-gyp/12.16.1/src -I/home/pi/.cache/node-gyp/12.16.1/deps/openssl/config -I/home/pi/.cache/node-gyp/12.16.1/deps/openssl/openssl/include -I/home/pi/.cache/node-gyp/12.16.1/deps/uv/include -I/home/pi/.cache/node-gyp/12.16.1/deps/zlib -I/home/pi/.cache/node-gyp/12.16.1/deps/v8/include -I/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src -I/usr/local/mongo-c-driver-1.15.3/src/libbson/src  -fPIC -pthread -Wall -Wextra -Wno-unused-parameter -O3 -fno-omit-frame-pointer  -MMD -MF ./Release/.deps/Release/obj.target/native/src/scan.o.d.raw   -c -o Release/obj.target/native/src/scan.o ../src/scan.c
Release/obj.target/native/src/scan.o: ../src/scan.c \
 /home/pi/.cache/node-gyp/12.16.1/include/node/node_api.h \
 /home/pi/.cache/node-gyp/12.16.1/include/node/js_native_api.h \
 /home/pi/.cache/node-gyp/12.16.1/include/node/js_native_api_types.h \
 /home/pi/.cache/node-gyp/12.16.1/include/node/node_api_types.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-compat.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-prelude.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-config.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-macros.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-atomic.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-context.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-types.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-endian.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-clock.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-decimal128.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-error.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-iter.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-json.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-keys.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-md5.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-memory.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-oid.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-reader.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-string.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-utf8.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-value.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-version.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-version-functions.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-writer.h \
 /usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bcon.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-macros.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-prelude.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-apm.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-host-list.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-server-description.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-read-prefs.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-config.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-topology-description.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-bulk-operation.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-write-concern.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-change-stream.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-client.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-collection.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-flags.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-cursor.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-index.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-read-concern.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-find-and-modify.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-database.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-gridfs.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-iovec.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-socket.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-gridfs-file.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-gridfs-file-list.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-ssl.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-uri.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-client-pool.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-error.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-gridfs-bucket.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-gridfs-file-page.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-init.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-matcher.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-handshake.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-opcode.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-log.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-client-session.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream-buffered.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream-file.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream-gridfs.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream-socket.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-version.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-version-functions.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-rand.h \
 /usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream-tls.h
../src/scan.c:
/home/pi/.cache/node-gyp/12.16.1/include/node/node_api.h:
/home/pi/.cache/node-gyp/12.16.1/include/node/js_native_api.h:
/home/pi/.cache/node-gyp/12.16.1/include/node/js_native_api_types.h:
/home/pi/.cache/node-gyp/12.16.1/include/node/node_api_types.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-compat.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-prelude.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-config.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-macros.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-atomic.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-context.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-types.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-endian.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-clock.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-decimal128.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-error.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-iter.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-json.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-keys.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-md5.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-memory.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-oid.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-reader.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-string.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-utf8.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-value.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-version.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-version-functions.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bson-writer.h:
/usr/local/mongo-c-driver-1.15.3/src/libbson/src/bson/bcon.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-macros.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-prelude.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-apm.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-host-list.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-server-description.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-read-prefs.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-config.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-topology-description.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-bulk-operation.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-write-concern.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-change-stream.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-client.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-collection.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-flags.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-cursor.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-index.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-read-concern.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-find-and-modify.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-database.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-gridfs.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-iovec.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-socket.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-gridfs-file.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-gridfs-file-list.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-ssl.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-uri.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-client-pool.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-error.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-gridfs-bucket.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-gridfs-file-page.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-init.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-matcher.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-handshake.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-opcode.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-log.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-client-session.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream-buffered.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream-file.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream-gridfs.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream-socket.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-version.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-version-functions.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-rand.h:
/usr/local/mongo-c-driver-1.15.3/src/libmongoc/src/mongoc/mongoc-stream-tls.h:
