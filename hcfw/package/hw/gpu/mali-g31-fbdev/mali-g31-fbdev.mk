################################################################################
#
# Mali G31 fbdev
#
################################################################################
MALI_G31_FBDEV_INSTALL_STAGING = YES
MALI_G31_FBDEV_PROVIDES = libegl libgles

define MALI_G31_FBDEV_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig

	cp $(BR2_EXTERNAL_HCFW_PATH)/package/hw/gpu/mali-g31-fbdev/lib/libmali.so.0.20.0 \
	  $(STAGING_DIR)/usr/lib/libmali.so

	(cd $(STAGING_DIR)/usr/lib && ln -sf libmali.so libMali.so)
	(cd $(STAGING_DIR)/usr/lib && ln -sf libmali.so libmali.so.0)
	(cd $(STAGING_DIR)/usr/lib && ln -sf libmali.so libmali.so.1)
	(cd $(STAGING_DIR)/usr/lib && ln -sf libmali.so libEGL.so)
	(cd $(STAGING_DIR)/usr/lib && ln -sf libmali.so libEGL.so.1)
	(cd $(STAGING_DIR)/usr/lib && ln -sf libmali.so libGLESv1_CM.so)
	(cd $(STAGING_DIR)/usr/lib && ln -sf libmali.so libGLESv1_CM.so.1)
	(cd $(STAGING_DIR)/usr/lib && ln -sf libmali.so libGLESv2.so)
	(cd $(STAGING_DIR)/usr/lib && ln -sf libmali.so libGLESv2.so.2)

	cp -rf \
	  $(BR2_EXTERNAL_HCFW_PATH)/package/hw/gpu/mali-g31-fbdev/include/* \
	  $(STAGING_DIR)/usr/include/

	$(INSTALL) -D -m 0644 \
	  $(BR2_EXTERNAL_HCFW_PATH)/package/hw/gpu/mali-g31-fbdev/pkgconfig/* \
	  $(STAGING_DIR)/usr/lib/pkgconfig/
endef

define MALI_G31_FBDEV_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib

	cp $(BR2_EXTERNAL_HCFW_PATH)/package/hw/gpu/mali-g31-fbdev/lib/libmali.so.0.20.0 \
	  $(TARGET_DIR)/usr/lib/libmali.so

	(cd $(TARGET_DIR)/usr/lib && ln -sf libmali.so libMali.so)
	(cd $(TARGET_DIR)/usr/lib && ln -sf libmali.so libmali.so.0)
	(cd $(TARGET_DIR)/usr/lib && ln -sf libmali.so libmali.so.1)
	(cd $(TARGET_DIR)/usr/lib && ln -sf libmali.so libEGL.so)
	(cd $(TARGET_DIR)/usr/lib && ln -sf libmali.so libEGL.so.1)
	(cd $(TARGET_DIR)/usr/lib && ln -sf libmali.so libGLESv1_CM.so)
	(cd $(TARGET_DIR)/usr/lib && ln -sf libmali.so libGLESv1_CM.so.1)
	(cd $(TARGET_DIR)/usr/lib && ln -sf libmali.so libGLESv2.so)
	(cd $(TARGET_DIR)/usr/lib && ln -sf libmali.so libGLESv2.so.2)
endef

$(eval $(generic-package))
