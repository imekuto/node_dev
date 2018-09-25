
# -------- nginxで利用する設定ファイル default.conf を作成' --------

COMMAND='sudo cp ~/provision-script/default.conf /etc/nginx/conf.d'
echo $COMMAND && eval ${COMMAND}

COMMAND='sudo systemctl restart nginx'
echo $COMMAND && eval ${COMMAND}
