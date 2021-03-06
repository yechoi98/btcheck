# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := native
DEFS_Debug := \
	'-DNODE_GYP_MODULE_NAME=native' \
	'-DUSING_UV_SHARED=1' \
	'-DUSING_V8_SHARED=1' \
	'-DV8_DEPRECATION_WARNINGS=1' \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DV8_IMMINENT_DEPRECATION_WARNINGS' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DBUILDING_NODE_EXTENSION' \
	'-DDEBUG' \
	'-D_DEBUG' \
	'-DV8_ENABLE_CHECKS'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++1y

INCS_Debug := \
	-I/home/pi/.cache/node-gyp/12.16.1/include/node \
	-I/home/pi/.cache/node-gyp/12.16.1/src \
	-I/home/pi/.cache/node-gyp/12.16.1/deps/openssl/config \
	-I/home/pi/.cache/node-gyp/12.16.1/deps/openssl/openssl/include \
	-I/home/pi/.cache/node-gyp/12.16.1/deps/uv/include \
	-I/home/pi/.cache/node-gyp/12.16.1/deps/zlib \
	-I/home/pi/.cache/node-gyp/12.16.1/deps/v8/include \
	-I/usr/local/include/libmongoc-1.0 \
	-I/usr/local/include/libbson-1.0/bson \
	-I/usr/local/include/libbson-1.0 \
	-I/usr/include/bluetooth

DEFS_Release := \
	'-DNODE_GYP_MODULE_NAME=native' \
	'-DUSING_UV_SHARED=1' \
	'-DUSING_V8_SHARED=1' \
	'-DV8_DEPRECATION_WARNINGS=1' \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DV8_IMMINENT_DEPRECATION_WARNINGS' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DBUILDING_NODE_EXTENSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-O3 \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++1y

INCS_Release := \
	-I/home/pi/.cache/node-gyp/12.16.1/include/node \
	-I/home/pi/.cache/node-gyp/12.16.1/src \
	-I/home/pi/.cache/node-gyp/12.16.1/deps/openssl/config \
	-I/home/pi/.cache/node-gyp/12.16.1/deps/openssl/openssl/include \
	-I/home/pi/.cache/node-gyp/12.16.1/deps/uv/include \
	-I/home/pi/.cache/node-gyp/12.16.1/deps/zlib \
	-I/home/pi/.cache/node-gyp/12.16.1/deps/v8/include \
	-I/usr/local/include/libmongoc-1.0 \
	-I/usr/local/include/libbson-1.0/bson \
	-I/usr/local/include/libbson-1.0 \
	-I/usr/include/bluetooth

OBJS := \
	$(obj).target/$(TARGET)/src/scan.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic

LDFLAGS_Release := \
	-pthread \
	-rdynamic

LIBS := \
	/usr/lib/arm-linux-gnueabihf/libbluetooth.a \
	/usr/local/lib/libbson-1.0.so \
	/usr/local/lib/libmongoc-1.0.so

$(obj).target/native.node: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/native.node: LIBS := $(LIBS)
$(obj).target/native.node: TOOLSET := $(TOOLSET)
$(obj).target/native.node: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,solink_module)

all_deps += $(obj).target/native.node
# Add target alias
.PHONY: native
native: $(builddir)/native.node

# Copy this to the executable output path.
$(builddir)/native.node: TOOLSET := $(TOOLSET)
$(builddir)/native.node: $(obj).target/native.node FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/native.node
# Short alias for building this executable.
.PHONY: native.node
native.node: $(obj).target/native.node $(builddir)/native.node

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/native.node

