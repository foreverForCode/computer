cd src

gitbook build

cp -r _book/* ../

cd ../

git add .

git commit -m "发布"

git push origin master

sleep 10

git push mayun master

echo "合并成功"
