# Actions for Building OpenWrt / AutoUpdate

![GitHub Stars](https://img.shields.io/github/stars/Hyy2001X/AutoBuild-Actions.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/Hyy2001X/AutoBuild-Actions.svg?style=flat-square&label=Forks&logo=github)

AutoBuild-Actions 稳定版/模板地址: [AutoBuild-Actions-Template](https://github.com/Hyy2001X/AutoBuild-Actions-Template)

自用软件包地址: [AutoBuild-Packages](https://github.com/Hyy2001X/AutoBuild-Packages)

支持的 OpenWrt 源码: `coolsnowwolf/lede`、`immortalwrt/immortalwrt`、`openwrt/openwrt`、`lienol/openwrt`

## 一、部署环境

1. 首先需要获取 **Github Token**: [点击这里](https://github.com/settings/tokens/new) 获取,

   `Note`项填写一个名称,`Select scopes`**全部打勾**,完成后点击下方`Generate token`

2. 复制页面中生成的 **Token**,**并保存到本地,Token 只会显示一次!**

3. **Fork** 我的`AutoBuild-Actions`仓库,然后进入你的`AutoBuild-Actions`仓库进行之后的设置

4. 点击上方菜单中的`Settings`,依次点击`Secrets`-`New repository secret`

   其中`Name`项随意填写,然后将你的 **Token** 粘贴到`Value`项,完成后点击`Add secert`

## 二、定制固件(可选,Fork 后可直接开始编译)

1. 进入你的`AutoBuild-Actions`仓库,**下方所有操作都将在你的`AutoBuild-Actions`仓库下进行**

   建议使用`Github Desktop`和`Notepad++`进行操作 [[Github Desktop](https://desktop.github.com/)] [[Notepad++](https://notepad-plus-plus.org/downloads/)]

   **提示**: 文中的**TARGET_PROFILE**为设备名称,可以在`.config`中获取,例如: `d-team_newifi-d2`、`asus_rt-acrh17`

   本地获取,在源码目录执行`egrep -o "CONFIG_TARGET.*DEVICE.*=y" .config | sed -r 's/.*DEVICE_(.*)=y/\1/'`
   
   或`grep 'TARGET_PROFILE' .config`

2. 编译`/Configs`目录中对应的配置文件,若设备配置不存在则需要把本地的`.config`文件**重命名**并上传

3. 编辑`/.github/workflows/*.yml`文件,修改`第 7 行`为易于自己识别的名称

4. 编辑`/.github/workflows/*.yml`文件,修改`第 32 行`为上传的`.config`文件名称

5. 按照需求且编辑`/Scripts/AutoBuild_DiyScript.sh`文件即可,`/Scripts`下的其他文件可以都不用修改

   **单独的软件包列表** 按照现有语法和提示编辑`/Scripts/AutoBuild_ExtraPackages.sh`

**/Scripts/AutoBuild_DiyScript.sh: Diy_Core() 函数中的变量解释:**
```
   Author 作者名称,若留空将自动获取为 Github 用户名
   
   Banner_Title Banner 标题,与作者名称一同在 Shell 展示

   * Default_LAN_IP 固件默认 LAN IP 地址

   Short_Firmware_Date 简短的固件日期 true: [20210601]; false: [202106012359]
   
   * Load_Common_Config 通用配置文件/Configs/Common,将被追加到当前设备的配置文件中

   * Load_CustomPackages_List 启用后,将运行 /Scripts/AutoBuild_ExtraPackages.sh 脚本

   Checkout_Virtual_Images 额外上传已检测到的 x86 虚拟磁盘镜像
   
   Firmware_Format 自定义固件格式,多个格式请用空格隔开

   REGEX_Skip_Checkout 固件检测屏蔽正则列表,用于过滤无用文件

   * INCLUDE_AutoBuild_Features 自动添加 AutoBuild 固件特性,例如: 一键更新、部分优化

   * INCLUDE_DRM_I915 自动启用 x86 设备的 Intel Graphics i915 驱动

   INCLUDE_Argon 自动添加 luci-theme-argon 主题和主题控制器

   INCLUDE_Obsolete_PKG_Compatible 完善原生 OpenWrt-19.07、21.02 支持 (测试特性)
   
   注: 禁用部分功能请将变量值修改为 false,开启则为 true
   
   带 * 符号的选项表示仅在 coolsnowwolf/lede 源码测试通过,这表示可能在其他源码不能友好地运行
```

## 三、开始编译固件

   **一键编译** 先删除`第 26-27 行`的注释并保存,单(双)击重新点亮右上角的 **Star** 即可一键编译

   **定时编译** 先删除`第 23-24 行`的注释,然后按需修改相关参数并保存,[使用方法](https://www.runoob.com/w3cnote/linux-crontab-tasks.html)

   **手动编译** 点击上方`Actions`,选择你要编译的设备名称,点击右方`Run workflow`,点击绿色按钮即可开始编译
   
   **临时修改 IP 地址** 该功能仅在**手动编译**时生效,点击`Run workflow`后即可输入 IP 地址(优先级**高于** `Default_LAN_IP`)

## 部署云端日志(可选)

1. 下载本仓库中的 [Update_Logs.json](https://github.com/Hyy2001X/AutoBuild-Actions/releases/download/AutoUpdate/Update_Logs.json) 到本地

2. 以 **JSON 格式**修改已下载到本地的`Update_Logs.json`文件

3. 上传修改后的`Update_Logs.json`到你仓库的`Release`

## 使用 AutoUpdate 一键更新固件脚本

   首先需要打开`TTYD 终端`或者使用`SSH`,按需输入下方指令:

   更新固件: `autoupdate`或`bash /bin/AutoUpdate.sh`

   更新固件(镜像加速 Ghproxy | FastGit): `autoupdate -P <G | F>`

   更新固件(不保留配置): `autoupdate -n`
   
   强制刷入固件: `autoupdate -F`
   
   "我不管,我就是要更新!": `autoupdate -f`

   查看所有可用参数: `autoupdate --help`

   **注意:** 部分参数可一起使用,例如: `autoupdate -n -P G -F --skip --path /mnt/sda1`

## 使用 tools 固件工具箱

   打开`TTYD 终端`或者使用`SSH`,执行指令`tools`或`bash /bin/AutoBuild_Tools.sh`即可启动固件工具箱

   当前支持以下功能:

   - USB 扩展内部空间
   - Samba 相关设置
   - 打印端口占用详细列表
   - 打印所有硬盘信息
   - 网络检查 (基础网络 | Google 连接检测)
   - AutoBuild 固件环境修复
   - 系统信息监控
   - 打印在线设备列表

## 鸣谢

   - [Lean's Openwrt Source code](https://github.com/coolsnowwolf/lede)

   - [P3TERX's Blog](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

   - [ImmortalWrt's Source code](https://github.com/immortalwrt)

   - [eSir 's workflow template](https://github.com/esirplayground/AutoBuild-OpenWrt/blob/master/.github/workflows/Build_OP_x86_64.yml)
   
   - 灵感来源/Based on: [openwrt-autoupdate](https://github.com/mab-wien/openwrt-autoupdate) [Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

   - 测试与建议: [CurssedCoffin](https://github.com/CurssedCoffin) [Licsber](https://github.com/Licsber) [sirliu](https://github.com/sirliu) [神雕](https://github.com/teasiu) [yehaku](https://www.right.com.cn/forum/space-uid-28062.html) [缘空空](https://github.com/NaiHeKK) [281677160](https://github.com/281677160)
