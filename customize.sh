echo "- 开始安装"

ls "$MODPATH"
  ui_print "$ZIPFILE"
  INSTALLER_MODPATH="$MODPATH"
  ui_print "---------------------------------"
  ui_print "安装附属"
  ui_print "---------------------------------"
  sleep 2
  for ZIPFILE in $MODPATH/module/*.zip; do
    ui_print "$ZIPFILE"
    install_module
  done