AUTOMOUNT=true
#获取机型
MarketName="`getprop ro.product.system.marketname`"
#获取设备
Device="`getprop ro.product.system.device`"
#获取认证型号
Model="`getprop ro.product.system.model`"
#获取Sdk
Sdk="`getprop ro.system.build.version.sdk`"
#获取安卓版本
Android="`getprop ro.system.build.version.release`"
# 获取模块版本
module_version="`grep_prop version $TMPDIR/module.prop`"
# 获取模块名称
module_name="`grep_prop name $TMPDIR/module.prop`"
# 获取模块id
module_id="`grep_prop id $TMPDIR/module.prop`"
# 获取模块作者
module_author="`grep_prop author $TMPDIR/module.prop`"
  sleep 0.3
  ui_print "- $module_name "
  ui_print "- 作者: $module_author"
  ui_print "- 版本: $module_version"
  ui_print "#########################"
  ui_print "- 设备相关信息↓"
  ui_print "- SDK: $Sdk"
  ui_print "- 你的机型为$MarketName."
  ui_print "- 设备: $Device"
  ui_print "- 认证型号为$Model"
  ui_print "- 安卓版本: Android $Android"
  ui_print "#########################"
  sleep 0.3
########################################
unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
# function
patch_public_libraries() {
for NAMES in $NAME; do
  if ! grep $NAMES $FILE; then
    echo $NAMES >> $FILE
  fi
done
chmod 0644 $FILE
}
######################################
  sleep 0.3
#获取刷入时间
Time=$(date "+%Y年%m月%d日 %H:%M:%S")
echo "- "
echo "- 刷入时间：$Time"
description=$MODPATH/module.prop
echo "刷入时间：$Time." >> $description
echo "- "
echo "- 完成..."