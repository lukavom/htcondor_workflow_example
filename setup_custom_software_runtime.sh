SOFTWARE_TARBALL=$1

PATH_TMP_SOFTWARE="/tmp/obut/software_$(date +"%Y%m%d%H%M%S")"
mkdir -p $PATH_TMP_SOFTWARE

tar -xzf $SOFTWARE_TARBALL --strip-components=1 -C $PATH_TMP_SOFTWARE

PATH=$PATH:$PATH_TMP_SOFTWARE