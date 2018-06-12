curpath=`pwd`
echo "Path is $curpath"
cd ../iocn-io.github.io
git pull
ls | xargs rm -rf
cp -r ../site/public/* .
echo "iocn.io" > CNAME
git config user.name "iocn-io"
git config user.email "iocn2x2y@gmail.com"
git add .
curtime=$(date "+%Y-%m-%d %H:%M:%S")
git commit -m "Site Updated on $curtime"
git push

cd $curpath
git config user.name "iocn-io"
git config user.email "iocn2x2y@gmail.com"
git add .
git commit -m "Deployed Site on $curtime"
git push
