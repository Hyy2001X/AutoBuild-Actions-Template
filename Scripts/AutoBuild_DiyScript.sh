#!/bin/bash
# AutoBuild Module by Hyy2001 <https://github.com/Hyy2001X/AutoBuild-Actions>
# AutoBuild DiyScript

Diy_Core() {
	Author=Hyy2001
	Default_LAN_IP=192.168.1.1
	Load_CustomPackages_List=true
	Short_Firmware_Date=true
	Checkout_Virtual_Images=false

	INCLUDE_AutoBuild_Features=true
	INCLUDE_DRM_I915=false
	INCLUDE_Argon=false
	INCLUDE_Obsolete_PKG_Compatible=false
}

Firmware-Diy() {
	:
}