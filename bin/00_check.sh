#!/bin/bash
# Simple script to list version numbers of critical development tools
#


tc_bash() {
  echo "ERROR: /bin/sh does not point to bash, fixing..."
  sudo rm /bin/sh
  sudo ln -s /bin/bash /bin/sh
}

tc_all() {
  sudo apt-get -qy update
  sudo apt-get -y install binutils gcc g++ bison texinfo
  grep binutils .profile || echo 'PATH="/usr/lib/binutils-2.26/bin/:$PATH"' >> .profile
}

export LC_ALL=C

tc_all

bash --version | head -n1 | cut -d" " -f2-4
MYSH=$(readlink -f /bin/sh)
CWD=$PWD
TPATH=$CWD/toolchain

echo "/bin/sh -> $MYSH"
echo $MYSH | grep -q bash || tc_bash
unset MYSH

echo -n "Binutils: "; ld --version | head -n1 | cut -d" " -f3-

bison --version | head -n1

if [ -h /usr/bin/yacc ]; then
  echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`";
elif [ -x /usr/bin/yacc ]; then
  echo yacc is `/usr/bin/yacc --version | head -n1`
else
  echo "yacc not found"
fi

bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-
echo -n "Coreutils: "; chown --version | head -n1 | cut -d")" -f2
diff --version | head -n1
find --version | head -n1
gawk --version | head -n1

if [ -h /usr/bin/awk ]; then
  echo "/usr/bin/awk -> `readlink -f /usr/bin/awk`";
elif [ -x /usr/bin/awk ]; then
  echo awk is `/usr/bin/awk --version | head -n1`
else
  echo "awk not found"
fi

# Fixing awk -> gawk
sudo rm $(which awk)
sudo ln -s $(which gawk) /usr/bin/awk

# Fixing yacc -> bison
sudo rm $(which yacc)
sudo ln -s $(which bison) /usr/bin/yacc

gcc --version | head -n1
g++ --version | head -n1
ldd --version | head -n1 | cut -d" " -f2-  # glibc version
grep --version | head -n1
gzip --version | head -n1
cat /proc/version
m4 --version | head -n1
make --version | head -n1
patch --version | head -n1
echo Perl `perl -V:version`
python3 --version
sed --version | head -n1
tar --version | head -n1
makeinfo --version | head -n1  # texinfo version
xz --version | head -n1

echo 'int main(){}' > dummy.c && g++ -o dummy dummy.c
if [ -x dummy ]
  then echo "g++ compilation OK";
  else echo "g++ compilation failed"; fi
rm -f dummy.c dummy
