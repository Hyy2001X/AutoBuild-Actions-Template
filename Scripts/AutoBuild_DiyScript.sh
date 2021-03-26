#!/bin/bash
# https://github.com/Hyy2001X/AutoBuild-Actions
# AutoBuild Module by Hyy2001
# AutoBuild DiyScript

Diy_Core() {
	Author=
	Default_Device=

	INCLUDE_AutoUpdate=true
	INCLUDE_AutoBuild_Tools=true
	INCLUDE_DRM_I915=false
}

Diy-Part1() {
	Diy_Part1_Base

}

Diy-Part2() {
	Diy_Part2_Base
}

Diy-Part3() {
	Diy_Part3_Base
}
