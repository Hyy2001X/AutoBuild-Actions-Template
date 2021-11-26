#!/bin/bash
# AutoBuild Module by Hyy2001 <https://github.com/Hyy2001X/AutoBuild-Actions>
# AutoBuild DiyScript

Firmware_Diy_Core() {

	Author=AUTO
	Author_URL=AUTO
	Default_IP="192.168.1.1"
	Banner_Message="Powered by AutoBuild-Actions"

	Short_Firmware_Date=true
	Checkout_Virtual_Images=false
	Firmware_Format=AUTO
	REGEX_Skip_Checkout="packages|buildinfo|sha256sums|manifest|kernel|rootfs|factory"

	INCLUDE_AutoBuild_Features=true
	INCLUDE_DRM_I915=false
	INCLUDE_Original_OpenWrt_Compatible=false
}

Firmware_Diy() {

	# 请在该函数内定制固件, 建议使用专业文本编辑器进行修改

	# 可用预设变量, 其他可用变量请参考运行日志
	# ${OP_AUTHOR}			OpenWrt 源码作者
	# ${OP_REPO}			OpenWrt 仓库名称
	# ${OP_BRANCH}			OpenWrt 源码分支
	# ${TARGET_PROFILE}		设备名称, 例如: d-team_newifi-d2
	# ${TARGET_BOARD}		设备架构, 例如: ramips

	# ${Home}				OpenWrt 源码位置
	# ${FEEDS_CONF}			[feeds.conf.default] 文件
	# ${CustomFiles}		仓库中的 /CustomFiles 绝对路径
	# ${Scripts}			仓库中的 /Scripts 绝对路径
	# ${FEEDS_LUCI}			OpenWrt 源码目录下的 package/feeds/luci
	# ${FEEDS_PKG}			OpenWrt 源码目录下的 package/feeds/packages
	# ${BASE_FILES}			俗称替换大法的路径, 位于 package/base-files/files

	:
}
