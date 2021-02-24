#!/bin/bash
# https://github.com/Hyy2001X/AutoBuild-Actions
# AutoBuild Module by Hyy2001
# AutoBuild DiyScript

Diy_Core() {
	Author=
	Default_Device=

	INCLUDE_AutoUpdate=true
	INCLUDE_AutoBuild_Tools=true
	INCLUDE_mt7621_OC1000MHz=false

	INCLUDE_SSR_Plus=true
	INCLUDE_Passwall=false
	INCLUDE_HelloWorld=false
	INCLUDE_Bypass=false
	INCLUDE_OpenClash=false
	INCLUDE_OAF=false
}

Diy-Part1() {
	Diy_Part1_Base

	ExtraPackages git lean luci-theme-argon https://github.com/jerrykuku 18.06
	ExtraPackages git other luci-app-adguardhome https://github.com/Hyy2001X master
	ExtraPackages git other luci-app-shutdown https://github.com/Hyy2001X master
}

Diy-Part2() {
	Diy_Part2_Base
}

Diy-Part3() {
	Diy_Part3_Base
}
