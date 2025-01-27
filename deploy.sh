
rm -rf build
git clone git@github.com:astrobunny/3d.astrobunny.net build
cd build
git checkout gh-pages
cd ..
mv build/.git gitbak
rm -rf build
mkdir -p build/weaver
sleep 2
docker run --rm -v $PWD/pages:/app/pages -v $PWD/images:/app/images -v $PWD/build:/app/build davidsiaw/nicedoc sh bin/build.sh
mv gitbak build/.git
cd build
echo $DOMAIN_NAME > CNAME
git add .
git commit -m "update"
git push
cd ..
