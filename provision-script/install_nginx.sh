
COMMAND='export DEBIAN_FRONTEND=noninteractive'
echo $COMMAND && eval ${COMMAND}


# apt-keyにnginxの署名を登録
COMMAND='curl http://nginx.org/keys/nginx_signing.key | sudo -E apt-key add -'
echo $COMMAND && eval ${COMMAND}


# /etc/apt/sources.listにnginxを追加
COMMAND='VCNAME=`cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2`'
echo $COMMAND && eval ${COMMAND}
COMMAND='echo "deb http://nginx.org/packages/ubuntu/ $VCNAME nginx" | sudo tee -a /etc/apt/sources.list'
echo $COMMAND && eval ${COMMAND}
COMMAND='echo "deb-src http://nginx.org/packages/ubuntu/ $VCNAME nginx" | sudo tee -a /etc/apt/sources.list'
echo $COMMAND && eval ${COMMAND}


COMMAND='sudo -E apt update'
echo $COMMAND && eval ${COMMAND}
COMMAND='sudo -E apt upgrade -y'
echo $COMMAND && eval ${COMMAND}


# nginxをインストール
COMMAND='sudo -E apt install nginx -y'
echo $COMMAND && eval ${COMMAND}

# /var/wwwにシンボリックリンクを作成
COMMAND='sudo -E ln -s /usr/share/nginx/html /var/www'
echo $COMMAND && eval ${COMMAND}

# Nginxのサービス開始
COMMAND='sudo -E systemctl start nginx'
echo $COMMAND && eval ${COMMAND}
