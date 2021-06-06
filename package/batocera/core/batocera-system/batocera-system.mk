################################################################################
#
# batocera.linux System
#
################################################################################

BATOCERA_SYSTEM_SOURCE=

BATOCERA_SYSTEM_VERSION = 32-dev
BATOCERA_SYSTEM_DATE_TIME = $(shell date "+%Y/%m/%d %H:%M")
BATOCERA_SYSTEM_DATE = $(shell date "+%Y/%m/%d")
BATOCERA_SYSTEM_DEPENDENCIES = tzdata

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3),y)
	BATOCERA_SYSTEM_ARCH=rpi3
	BATOCERA_SYSTEM_BATOCERA_CONF=rpi3
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3399),y)
	BATOCERA_SYSTEM_ARCH=rk3399
	BATOCERA_SYSTEM_BATOCERA_CONF=rk3399
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3288),y)
	BATOCERA_SYSTEM_ARCH=rk3288
	BATOCERA_SYSTEM_BATOCERA_CONF=rk3288
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_LIBRETECH_H5),y)
	BATOCERA_SYSTEM_ARCH=libretech_h5
	BATOCERA_SYSTEM_BATOCERA_CONF=libretech_h5
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ORANGEPI_ZERO2),y)
	BATOCERA_SYSTEM_ARCH=orangepi_zero2
	BATOCERA_SYSTEM_BATOCERA_CONF=orangepi_zero2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ORANGEPI_PC),y)
	BATOCERA_SYSTEM_ARCH=orangepi_pc
	BATOCERA_SYSTEM_BATOCERA_CONF=orangepi_pc
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
	BATOCERA_SYSTEM_ARCH=s812
	BATOCERA_SYSTEM_BATOCERA_CONF=s812
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
	BATOCERA_SYSTEM_ARCH=s922x
	BATOCERA_SYSTEM_BATOCERA_CONF=s922x
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODROIDGOA),y)
	BATOCERA_SYSTEM_ARCH=odroidgoa
	BATOCERA_SYSTEM_BATOCERA_CONF=odroidgoa
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_XU4),y)
	BATOCERA_SYSTEM_ARCH=odroidxu4
	BATOCERA_SYSTEM_BATOCERA_CONF=xu4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODROIDC2),y)
	BATOCERA_SYSTEM_ARCH=odroidc2
	BATOCERA_SYSTEM_BATOCERA_CONF=odroidc2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODROIDC4),y)
	BATOCERA_SYSTEM_ARCH=odroidc4
	BATOCERA_SYSTEM_BATOCERA_CONF=odroidc4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S905),y)
	BATOCERA_SYSTEM_ARCH=s905
	BATOCERA_SYSTEM_BATOCERA_CONF=s905
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S905GEN3),y)
	BATOCERA_SYSTEM_ARCH=s905gen3
	BATOCERA_SYSTEM_BATOCERA_CONF=s905gen3
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S912),y)
	BATOCERA_SYSTEM_ARCH=s912
	BATOCERA_SYSTEM_BATOCERA_CONF=s912
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_CHA),y)
	BATOCERA_SYSTEM_ARCH=cha
	BATOCERA_SYSTEM_BATOCERA_CONF=cha
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86),y)
	BATOCERA_SYSTEM_ARCH=x86
	BATOCERA_SYSTEM_BATOCERA_CONF=x86
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64),y)
	BATOCERA_SYSTEM_ARCH=x86_64
	BATOCERA_SYSTEM_BATOCERA_CONF=x86_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI2),y)
	BATOCERA_SYSTEM_ARCH=rpi2
	BATOCERA_SYSTEM_BATOCERA_CONF=rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI1),y)
	BATOCERA_SYSTEM_ARCH=rpi1
	BATOCERA_SYSTEM_BATOCERA_CONF=rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
	BATOCERA_SYSTEM_ARCH=rpi4
	BATOCERA_SYSTEM_BATOCERA_CONF=rpi4
else
	BATOCERA_SYSTEM_ARCH=unknown
	BATOCERA_SYSTEM_BATOCERA_CONF=unknown
endif

define BATOCERA_SYSTEM_INSTALL_TARGET_CMDS

	# version/arch
	mkdir -p $(TARGET_DIR)/usr/share/batocera
	echo -n "$(BATOCERA_SYSTEM_ARCH)" > $(TARGET_DIR)/usr/share/batocera/batocera.arch
	echo $(BATOCERA_SYSTEM_VERSION) $(BATOCERA_SYSTEM_DATE_TIME) > $(TARGET_DIR)/usr/share/batocera/batocera.version

	# datainit
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-system/batocera.conf $(TARGET_DIR)/usr/share/batocera/datainit/system

	# batocera-boot.conf
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-system/batocera-boot.conf $(BINARIES_DIR)/batocera-boot.conf

	# mounts
	mkdir -p $(TARGET_DIR)/boot $(TARGET_DIR)/overlay $(TARGET_DIR)/userdata
endef

$(eval $(generic-package))
