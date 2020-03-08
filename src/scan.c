#include <node_api.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <bluetooth/bluetooth.h>
#include <bluetooth/hci.h>
#include <bluetooth/hci_lib.h>
#include <mongoc/mongoc.h>
#include <bson/bson.h>
#include <sys/time.h>

void scanBluetoothDevices(napi_env env, napi_callback_info info){
    inquiry_info* ii = NULL;
	int max_rsp, num_rsp;
	int dev_id, sock, len, flags;
	char addr[19] = { 0 };
	char* str;
	bson_t* document;
	mongoc_client_t* client;
	mongoc_collection_t* collection;
	bson_error_t error;
	bson_oid_t oid;
	struct timeval tv;
	unsigned long long millisecondsSinceEpoch;

	len = 3; // 1.28*len초
	max_rsp = 50;
	flags = IREQ_CACHE_FLUSH;

		dev_id = hci_get_route(NULL);
		sock = hci_open_dev(dev_id);
		if (dev_id < 0 || sock < 0) {
			perror("opening socket");
			exit(1);
		}

		ii = (inquiry_info*)malloc(max_rsp * sizeof(inquiry_info));
		num_rsp = hci_inquiry(dev_id, len, max_rsp, NULL, &ii, flags);
		if (num_rsp < 0) perror("hci_inquiry");

		mongoc_init();
		client = mongoc_client_new("mongodb://yechoi:0000@192.168.1.13:27017/");
		collection = mongoc_client_get_collection(client, "btcheck", "scans");


		for (int i = 0; i < num_rsp; i++) {
			ba2str(&(ii + i)->bdaddr, addr);
			gettimeofday(&tv, NULL);
			millisecondsSinceEpoch= (unsigned long long)(tv.tv_sec) * 1000 + (unsigned long long)(tv.tv_usec) / 1000;
			document = bson_new();
			bson_oid_init(&oid, NULL);
			BSON_APPEND_OID(document, "_id", &oid);
			BSON_APPEND_UTF8(document, "address", addr);
			BSON_APPEND_DATE_TIME(document, "time", millisecondsSinceEpoch);
			if (!mongoc_collection_insert_one(
				collection, document, NULL, NULL, &error)) {
				fprintf(stderr, "%s\n", error.message);
			}
			bson_destroy(document);

		}

		printf("bluetooth devices scanning finished.\n");

		mongoc_client_destroy(client);
		mongoc_collection_destroy(collection);
		mongoc_cleanup();
		free(ii);
		close(sock);

    return;
}

napi_value Init(napi_env env, napi_value exports) {
  napi_status status;
  napi_value fn;

  status = napi_create_function(env, NULL, 0, scanBluetoothDevices, NULL, &fn);
  if (status != napi_ok) {
    napi_throw_error(env, NULL, "Unable to wrap native function");
  }

  status = napi_set_named_property(env, exports, "scanBluetoothDevices", fn);
  if (status != napi_ok) {
    napi_throw_error(env, NULL, "Unable to populate exports");
  }

  return exports;
}

NAPI_MODULE(NODE_GYP_MODULE_NAME, Init)