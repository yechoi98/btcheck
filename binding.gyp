{
  "targets": [
    {
      "target_name": "native",
      "sources": [
        "./src/scan.c"
      ],
     "include_dirs": ["/usr/local/include/libmongoc-1.0",
     "/usr/local/include/libbson-1.0/bson",
"/usr/local/include/libbson-1.0/"
	],
     "libraries": ["/usr/include/bluetooth/bluetooth.h","/usr/include/bluetooth/hci.h","/usr/include/bluetooth/hci_lib.h", "/usr/local/lib/libbson-1.0.so", "/usr/local/lib/libmongoc-1.0.so"]
    }
  ]
}
