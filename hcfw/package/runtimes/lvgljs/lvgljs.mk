####################
# lvgljs package #
####################

LVGLJS_VERSION = 20fc232e097ff429a5af160c6b9dbbb86b6ab0c1
LVGLJS_SITE = https://github.com/lvgl/lv_binding_js.git
LVGLJS_SITE_METHOD = git
LVGLJS_LICENSE = MIT
LVGLJS_GIT_SUBMODULES = YES
LVGLJS_CONF_OPTS = -DUSE_EXTERNAL_FFI=ON -DBUILD_NATIVE=OFF -DLVGL_PATH=deps/lvgl/lvgl.h

define LVGLJS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define LVGLJS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/lvgljs $(TARGET_DIR)/usr/bin/lvgljs
endef

$(eval $(cmake-package))
