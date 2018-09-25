
# anyenvをインストール(**envを便利に利用する為)
COMMAND='git clone https://github.com/riywo/anyenv ~/.anyenv'
echo $COMMAND && eval ${COMMAND}

echo 'export PATH="$PATH:~/.anyenv/bin" >> ~/.bashrc'
echo 'export PATH="$PATH:~/.anyenv/bin"' >> ~/.bashrc

echo 'eval eval "$(anyenv init -)" >> ~/.bashrc'
echo 'eval eval "$(anyenv init -)"' >> ~/.bashrc

source ~/.bashrc


# **env環境をアップデートする為のプラグインの導入とアップデートを行う
COMMAND='mkdir -p $(anyenv root)/plugins'
echo $COMMAND && eval ${COMMAND}

COMMAND='git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update'
echo $COMMAND && eval ${COMMAND}

COMMAND='anyenv update'
echo $COMMAND && eval ${COMMAND}


# nodeバージョンを切り替える為のnodenvのインストール
COMMAND='sudo $HOME/.anyenv/bin/anyenv install nodenv'
echo $COMMAND && eval ${COMMAND}

echo 'export PATH="$PATH:~/.anyenv/envs/nodenv/bin" >> ~/.bashrc'
echo 'export PATH="$PATH:~/.anyenv/envs/nodenv/bin"' >> ~/.bashrc

echo 'eval "$(nodenv init -)" >> ~/.bashrc'
echo 'eval "$(nodenv init -)"' >> ~/.bashrc

# パーミッションを緩くしてあげないと $(nodenv init -) でフォルダが作成できない・・・(理由はわかっていない)
COMMAND='sudo chmod 777 ~/.anyenv/envs/nodenv'
echo $COMMAND && eval ${COMMAND}

source ~/.bashrc


# 指定バージョンの node.js を nodenv 管理下にインストール(作成時の最新8.11.3)
COMMAND='nodenv install 8.11.3'
echo $COMMAND && eval ${COMMAND}


# node.jsのグローバルバージョンを指定
COMMAND='nodenv global 8.11.3'
echo $COMMAND && eval ${COMMAND}
