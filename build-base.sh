export APP_DIR=`pwd`
export TOOL_SCRIPT_DIR=$APP_DIR/tool-scripts
export LOCAL_CACHE_DIR=$APP_DIR/local-cache

export RELEASES_DIR=$APP_DIR/releases
export TMP_DIR=$(mktemp -d -t cjk-fonts-$(date +%Y%m%d%H%M%S)-XXXX)
# CHANGE SAVE_CACHE=0 NOT SAVE DOWNLOAD
# CHANGE SAVE_CACHE=1 SAVE DOWNLOAD TO LOCAL_CACHE_DIR FOR USE_LOCALE NEXT TIME
export SAVE_CACHE=1

# CHANGE USE_LOCAL=0 DOWNLOAD FROM URL
# CHANGE USE_LOCAL=1 COPY FROM LOCAL_CACHE_DIR
export USE_LOCAL=1


mkdir -p $LOCAL_CACHE_DIR
mkdir -p $RELEASES_DIR
mkdir -p $RELEASES_DIR/Sans
mkdir -p $RELEASES_DIR/SansMono
mkdir -p $RELEASES_DIR/Serif

export SRC_SansCJK_URL=https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004
export SansCJK_HK_ZIP=10_NotoSansCJKhk.zip
export SansCJK_JP_ZIP=06_NotoSansCJKjp.zip
export SansCJK_KR_ZIP=07_NotoSansCJKkr.zip
export SansCJK_SC_ZIP=08_NotoSansCJKsc.zip
export SansCJK_TC_ZIP=09_NotoSansCJKtc.zip

export SRC_SansMonoCJK_URL=https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004
export SansMonoCJK_HK_ZIP=15_NotoSansMonoCJKhk.zip
export SansMonoCJK_JP_ZIP=11_NotoSansMonoCJKjp.zip
export SansMonoCJK_KR_ZIP=12_NotoSansMonoCJKkr.zip
export SansMonoCJK_SC_ZIP=13_NotoSansMonoCJKsc.zip
export SansMonoCJK_TC_ZIP=14_NotoSansMonoCJKtc.zip

export SRC_SerifCJK_URL=https://github.com/googlefonts/noto-cjk/releases/download/Serif2.001
export SerifCJK_HK_ZIP=11_NotoSerifCJKhk.zip
export SerifCJK_JP_ZIP=07_NotoSerifCJKjp.zip
export SerifCJK_KR_ZIP=08_NotoSerifCJKkr.zip
export SerifCJK_SC_ZIP=09_NotoSerifCJKsc.zip
export SerifCJK_TC_ZIP=10_NotoSerifCJKtc.zip

