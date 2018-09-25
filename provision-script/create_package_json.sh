
# -------- npmで利用するローカルパッケージ管理ファイル package.json を作成 --------

# 既存の package.json が存在しない場合のみ作成する
if [ ! -e ~/project/package.json ]; then
  COMMAND='cp ~/provision-script/package.json ~/project'
  echo $COMMAND && eval ${COMMAND}

  COMMAND='chmod 776 ~/project/package.json'
  echo $COMMAND && eval ${COMMAND}
else
  echo 'すでに ~/project/webpack.config.js が存在していた為作成は行いませんでした。'
fi
