# HOW TO

```sh
mkdir tmp
cd tmp

#	ln -s thirdparty/lua-aio-scripts/ldoc/ldoc.with-dependencies.fake.rockspec


git clone https://github.com/tst2005/ldoc ;# or git clone https://github.com/stevedonovan/LDoc ldoc
cd ldoc
git clone https://github.com/tst2005/lua-aio
git clone https://github.com/tst2005/lua-aio-scripts
ln -s lua-aio-scripts/ldoc bundle-setup

git clone //github.com/mpeterv/markdown
git clone https://github.com/tst2005/lua-penlight ; cd lua-penlight ; git co allinone ; cd ..

sh bundle-setup/make-all-in-one.sh
# or
#LUA=lua sh bundle-setup/make-all-in-one.sh
# or
#LUA=luajit2.1 sh bundle-setup/make-all-in-one.sh

# show the result file(s)
ls -l generated-bundle/
ls -l bin/ldoc
```
