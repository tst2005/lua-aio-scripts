# HOW TO

```sh
mkdir tmp
cd tmp

git clone https://github.com/tst2005/lunajson
cd lunajson
git clone https://github.com/tst2005/lua-aio
git clone https://github.com/tst2005/lua-aio-scripts
ln -s lua-aio-scripts/lunajson bundle-setup

sh bundle-setup/make-all-in-one.sh
# or
#LUA=lua sh bundle-setup/make-all-in-one.sh
# or
#LUA=luajit2.1 sh bundle-setup/make-all-in-one.sh

# show the result file(s)
ls -l generated-bundle/
```
