cd src

gitbook build

cp -r _book/* ../

cd ../

git add .

git commit -m "发布"

git push origin master

git push mayun master
