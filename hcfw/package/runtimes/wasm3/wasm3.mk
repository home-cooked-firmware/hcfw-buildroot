#################
# wasm3 package #
#################

WASM3_VERSION = 79d412ea5fcf92f0efe658d52827a0e0a96ff442
WASM3_SITE = https://github.com/wasm3/wasm3.git
WASM3_SITE_METHOD = git
WASM3_LICENSE = MIT
WASM3_CONF_OPTS = -DBUILD_NATIVE=OFF

define WASM3_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define WASM3_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/wasm3 $(TARGET_DIR)/usr/bin/wasm3
endef

$(eval $(cmake-package))
