echo 'パスワードマネージャーへようこそ！'
while :
do
echo "次の選択肢から入力してください(Add password/Get password/Exit)"
read choice
if [[ "$choice" = "Add password" ]]; then
  echo 'サービス名を入力してください:'
  read servicename
  echo 'ユーザー名を入力してください:'
  read username
  echo 'パスワードを入力してください:'
  read password
  echo "${servicename}:${username}:${password}" >> pass.txt
  echo 'パスワードの追加は成功しました。'
  
elif [[ "$choice" = "Get password" ]]; then
  echo 'サービス名を入力してください:'
  read servicename
  array=($(grep $servicename pass.txt))
  service=`echo ${array} | cut -d ':' -f1`
  username=`echo ${array} | cut -d ':' -f2`
  password=`echo ${array} | cut -d ':' -f3`
  if [[ $? = 0 ]] && [[ "$servicename" = "$service" ]]; then
    echo "サービス名:${service}"
    echo "ユーザー名:${username}"
    echo "パスワード:${password}"
  else
    echo "そのサービスは登録されていません。"
  fi
elif [[ "$choice" = "Exit" ]]; then
  echo 'Thank you!'
  break
else
  echo "入力を間違えています。Add Password/Get password/Exitから入力してください。"
fi
done
