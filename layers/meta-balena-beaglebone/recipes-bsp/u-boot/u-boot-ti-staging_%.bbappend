UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot

UBOOT_MACHINE = "am335x_evm_config"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI:append = " \
    file://0001-Integrate-with-Balena-environment-configuration.patch \
    file://0002-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch \
    file://0005-Autoboot-keyboard-beaglebone-fixes.patch \
    file://0001-Add-support-for-BeagleBoard.org-PocketBeagle.patch \
    file://uEnv.txt_internal \
    "

SRC_URI:append:beaglebone-pocket = " \
    file://0001-u-boot-Disable-logging-on-UART0.patch \
    "

do_deploy:append () {
    install ${WORKDIR}/uEnv.txt_internal ${DEPLOYDIR}
}
