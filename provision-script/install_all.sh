
# セットアップ済み判定
#if [ -f ~/.js_build_env.setuped.txt ]; then
#    exit 0
#fi

# source ~/.bashrc が効かないので該当の行を削除する作業
sed -e '6,9d' ~/.bashrc > ~/tmp_bashrc.sh
rm -f ~/.bashrc
mv ~/tmp_bashrc.sh ~/.bashrc

SCRIPT="$HOME/provision-script/install_expect.sh"
source "$SCRIPT"

SCRIPT="$HOME/provision-script/install_nginx.sh"
source "$SCRIPT"

SCRIPT="$HOME/provision-script/create_nginx_config.sh"
source "$SCRIPT"

SCRIPT="$HOME/provision-script/install_node.sh"
source "$SCRIPT"

SCRIPT="$HOME/provision-script/install_forever.sh"
#source "$SCRIPT"

#cd ~/project

#SCRIPT="$HOME/provision-script/create_package_json.sh"
#source "$SCRIPT"

# touch ~/.js_env_setuped.flag.txt
# echo "js_build_envのセットアップ済みを示すファイルです。"