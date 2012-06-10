# installere io
wget https://github.com/stevedekorte/io/tarball/2011.09.12
tar xvfz 2011.09.12
cd steve<tab>
# patch https://github.com/stevedekorte/io/issues/135#issuecomment-3007011
cmake -DCMAKE_INSTALL_PREFIX='/usr/local/Cellar/io/2011.09.12' -DCMAKE_BUILD_TYPE=None -Wno-dev
make
make install
echo "export DYLD_LIBRARY_PATH=/usr/local/Cellar/io/2011.09.12/lib/" >> .profile
bash
io
