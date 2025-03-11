# mali-g31-fbdev-64
#
# 64-bit Mali G31 user space blobs.
MALI_G31_FBDEV_64_VERSION = f91ad32d45f09b9ea437bd19b8099b30400bb85f
MALI_G31_FBDEV_64_SITE_METHOD = local
MALI_G31_FBDEV_64_SITE = $(BR2_EXTERNAL_HCFW_PATH)/package/hw/gpu/mali-g31-fbdev-64
MALI_G31_FBDEV_64_LICENSE = Proprietary
MALI_G31_FBDEV_64_INSTALL_STAGING = YES

define MALI_G31_FBDEV_64_INSTALL_STAGING_CMDS
	mkdir -p ${STAGING_DIR}/usr/lib/pkgconfig

	cp -rf $(@D)/include/* $(STAGING_DIR)/usr/include/
	cp -rf $(@D)/lib/* $(STAGING_DIR)/usr/lib/

	$(INSTALL) -D -m 0644  $(BR2_EXTERNAL_HCFW_PATH)/package/hw/gpu/mali-g31-fbdev-64/pkgconfig/egl.pc \
			$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc

	$(INSTALL) -D -m 0644  $(BR2_EXTERNAL_HCFW_PATH)/package/hw/gpu/mali-g31-fbdev-64/pkgconfig/glesv2.pc \
			$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
endef

define MALI_G31_FBDEV_64_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib
	cp -rf $(@D)/lib/* $(TARGET_DIR)/usr/lib/
endef

$(eval $(generic-package))
