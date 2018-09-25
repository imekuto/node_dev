# 問題
foreverをサービスとして起動できない。

詳しく書くと forever 実行中に起動させるべき node のパスが解決できていない模様。

# node.jsの開発環境

## ターゲットOS
Ubuntu Ubuntu18.04

## 仮装環境
macOS 上に Vagrant + VirtualBox で上記 Ubuntu をインストールしています。

## 利用手順
1. クローンした後に Vagrant ファイルがある所に移動
2. vagrant up
3. vagrant ssh
4. ゲストのUbuntu内 ~/ で ./provision-script/install_all.sh を実行
5. ゲストのUbuntu内 ~/ で ./provision-script/install_forever.sh を実行

4番が終わった後に下記を行ってインストールできたかを確認。

```
Sep 25 07:18:38 ubuntu-bionic forever-node[20283]: /usr/bin/env: ‘node’: No such file or directory
source .bashrc  ... (exitの後にvagrant sshで入り直してもOK)
node -v
nginx -v
```

それぞれのバージョンが確認ればnginxとnodeのインストールは成功しています。

5番はforeverをインストールした後、systemctlにサービスとして登録するスクリプトです。
forever.serviceがサービス登録用に作成したUnitファイルです。

最終的にはスクリプト内の下記の部分で起動に失敗します。
```
COMMAND='sudo systemctl start forever.service'
```

/var/log/syslogを確認した所、下記を発見。
```
Sep 25 07:18:38 ubuntu-bionic forever-node[20283]: /usr/bin/env: ‘node’: No such file or directory
```

serviceとして起動したいforeverがnodeを利用しようとした時にパスが通っていなくて見つけられなかったかんじでしょうか・・・。

Unitファイルには EnvironmentFile を指定して環境変数を設定できるようでした。
./provision-script/forever_envを作成して指定してみたところエラーとなってしまったので現在はUnitファイル内では指定していません。

どの様にしたらパスがとおせるでしょうか？