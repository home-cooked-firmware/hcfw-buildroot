####################
# txiki_js package #
####################

TXIKI_JS_VERSION = 7e961ef3911e0a98f8e87c3aaa115a596dfcf9a5
TXIKI_JS_SITE = https://github.com/joe-damore/txiki.js.git
TXIKI_JS_SITE_METHOD = git
TXIKI_JS_LICENSE = MIT
TXIKI_JS_GIT_SUBMODULES = YES
TXIKI_JS_DEPENDENCIES = libcurl libffi
TXIKI_JS_CONF_OPTS = -DUSE_EXTERNAL_FFI=ON -DBUILD_NATIVE=OFF

define TXIKI_JS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define TXIKI_JS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/tjs $(TARGET_DIR)/usr/bin/tjs
endef

$(eval $(cmake-package))
