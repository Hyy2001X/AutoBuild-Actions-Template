#!/bin/bash
# AutoBuild Module by Hyy2001 <https://github.com/Hyy2001X/AutoBuild-Actions>
# AutoBuild DiyScript

Diy_Core() {
	Author=Hyy2001
	Short_Firmware_Date=true
	Default_LAN_IP=192.168.1.1

	INCLUDE_AutoBuild_Features=true
	INCLUDE_DRM_I915=false
	INCLUDE_Argon=true
	INCLUDE_Obsolete_PKG_Compatible=false
	
	Load_CustomPackages_List=true
	Checkout_Virtual_Images=false
}

Firmware-Diy() {
	:
}