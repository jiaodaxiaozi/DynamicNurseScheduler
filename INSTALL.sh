#!/bin/bash

CURRENT_DIR="$(pwd)"
DIR=$1
if [ -z $1 ]
then
  DIR=$CURRENT_DIR
fi

# Install Boost (no need to install the library as we are using only the headers)
cd $DIR
wget -O boost_1_64_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.64.0/boost_1_64_0.tar.gz/download
tar xzvf boost_1_64_0.tar.gz
# cd boost_1_64_0/
# ./bootstrap.sh
# ./b2 threading=multi
# cd ..
rm boost_1_64_0.tar.gz

# Install BCP
cd $DIR
svn co https://projects.coin-or.org/svn/Bcp/stable/1.4 Bcp-1.4
mkdir -p Bcp-1.4/build
cd Bcp-1.4/build && ../configure --enable-shared=no --enable-static=yes --with-cpx=no && make && make test && make install
cd $CURRENT_DIR
