#!/bin/sh
echo 'パスワードマネージャーへようこそ！'
echo 'サービス名を入力してください:'
read servicename
echo 'ユーザー名を入力してください:'
read username
echo 'パスワードを入力してください:'
read password
echo 'Thank you!'

echo "${servicename}:${username}:${password}" >> pass.txt
