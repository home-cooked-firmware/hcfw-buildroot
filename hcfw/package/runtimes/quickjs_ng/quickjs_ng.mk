################################################################################
#
# quickjs-ng
#
################################################################################

QUICKJS_NG_VERSION = 763010663b218c0ded27b31d8b91ec204b9db4f5
QUICKJS_NG_SITE = https://github.com/quickjs-ng/quickjs.git
QUICKJS_NG_SITE_METHOD = git
QUICKJS_NG_LICENSE = MIT
QUICKJS_NG_LICENSE_FILES = LICENSE
QUICKJS_NG_CPE_ID_VALID = YES
QUICKJS_NG_INSTALL_STAGING = YES
QUICKJS_NG_CONF_OPTS = -DBUILD_SHARED_LIBS=ON

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
QUICKJS_NG_EXTRA_LIBS += -latomic
endif

define QUICKJS_NG_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		CROSS_PREFIX="$(TARGET_CROSS)" \
		EXTRA_LIBS="$(QUICKJS_NG_EXTRA_LIBS)" \
		all
endef

define QUICKJS_NG_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		CROSS_PREFIX="$(TARGET_CROSS)" \
		EXTRA_LIBS="$(QUICKJS_NG_EXTRA_LIBS)" \
		DESTDIR=$(STAGING_DIR) \
		STRIP=/bin/true \
		prefix=/usr \
		install
endef

define QUICKJS_NG_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		CROSS_PREFIX="$(TARGET_CROSS)" \
		EXTRA_LIBS="$(QUICKJS_NG_EXTRA_LIBS)" \
		DESTDIR=$(TARGET_DIR) \
		STRIP=/bin/true \
		prefix=/usr \
		install
endef

$(eval $(cmake-package))
