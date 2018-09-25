
INSTALL_FOREVER=$(cat <<- EOS
  set timeout -1
  spawn npm install -g forever
  expect \"added 1 package\"
  exit 0
EOS
)

# foreverのインストール
COMMAND='expect -c "$INSTALL_FOREVER"'
echo $COMMAND && eval ${COMMAND}

# サービス登録用のUnitファイルを作成 ... Unitファイル内のパスは要注意
COMMAND='sudo cp $HOME/provision-script/forever.service /etc/systemd/system/forever.service'
echo $COMMAND && eval ${COMMAND}

# foreverにパスを通す
echo 'export PATH="$PATH:~/.anyenv/envs/nodenv/versions/8.11.3/bin/forever" >> ~/.bashrc'
echo 'export PATH="$PATH:~/.anyenv/envs/nodenv/versions/8.11.3/bin/forever"' >> ~/.bashrc
source ~/.bashrc

# サービス開始 
COMMAND='sudo systemctl start forever.service'
echo $COMMAND && eval ${COMMAND}

# サービス自動起動
COMMAND='sudo systemctl enable forever.service'
echo $COMMAND && eval ${COMMAND}
