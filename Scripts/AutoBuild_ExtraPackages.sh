#!/bin/bash
# AutoBuild Module by Hyy2001 <https://github.com/Hyy2001X/AutoBuild-Actions>
# AutoBuild ExtraPackages

# 推荐使用的 case 判断参数:
# OP_Maintainer		Openwrt 源码作者,例如 [coolsnowwolf] [openwrt] [lienol/Lienol] [immortalwrt]
# OP_REPO_NAME		Openwrt 仓库名称,例如 [lede] [openwrt] [immortalwrt]
# OP_BRANCH			Openwrt 源码分支,例如 [master] [main] [openwrt-21.02] [v21.02.0-rc3] ...
# TARGET_PROFILE	设备名称,例如 [asus_rt-acrh17] [d-team_newifi-d2] [redmi_ax6] ...
# TARGET_BOARD		设备架构,例如 [x86] [ramips] [ipq807x] [ath79] ...
#
# [git] 推荐: AddPackage git 存放位置 仓库名称 仓库作者 分支
# 或者(等同于上方指令): git clone -b 分支 仓库地址 存放位置
# [svn] 推荐: AddPackage svn 存放位置 软件包名 仓库作者/仓库名称/branches/分支/路径(可选)
# 或者(等同于上方指令): svn checkout 仓库地址/branches/分支/路径(可选) 存放位置

# 区分不同源码
case "${OP_Maintainer},${OP_REPO_NAME},${OP_BRANCH}" in
coolsnowwolf,lede,master)
	AddPackage git other luci-app-adguardhome Hyy2001X
;;
openwrt,openwrt,openwrt-21.02)
	:
;;
openwrt,openwrt,v21.02.0-rc3)
	:
;;
immortalwrt,immortalwrt,master)
	:
;;
esac

# 区分不同设备
case "${TARGET_PROFILE}" in
asus_rt-acrh17)
	:
;;
lenovo_newifi-d1 | d-team_newifi-d2 | xiaoyu_xy-c5)
	:
;;
x86_64 | x86)
	:
;;
redmi_ax6)
	:
;;
xiaomi_redmi-router-ac2100)
	:
;;
lenovo_newifi-y1)
	:
;;
esac