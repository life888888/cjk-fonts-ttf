source build-base.sh

# Noto Font CJK: 1 = Build , 0 = None
# * Noto Sans CJK
# * Noto Sans Mono CJK
# * Noto Serif CJK
export BUILD_FONT_FS_SANS=1
export BUILD_FONT_FS_SANSMONO=1
export BUILD_FONT_FS_SERIF=1

# Languages: 1 = Build , 0 = None
# * SC (Simplified Chinese)
# * TC (Traditional Chinese)
# * HK (Hong Kong)
# * JP (Japanese)
# * KR (Korean)
export BUILD_FONT_LANG_SC=1
export BUILD_FONT_LANG_TC=1
export BUILD_FONT_LANG_HK=1
export BUILD_FONT_LANG_JP=1
export BUILD_FONT_LANG_KR=1


export PATH=`pwd`:$PATH

# build-font-fs-lang.sh input parameter
# $1 FONTNAME_FS="Sans Mono" 
# $2 FONTNAME_FS_S=SansMono 
# $3 export FONT_LANG=TC 
# $4 export FONT_LANG_L=tc 
# $5 export ZIP_FILE=14_NotoSansMonoCJKtc.zip 
# $6 export SRC_BASE_URL=https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004 
# $7 export EXT_DIR=$7
if [ $BUILD_FONT_FS_SANS -eq 1 ]
then
  echo "BUILD FONT - NOTO SANS CJK START"
  export B_FONTNAME_FS="Sans"
  export B_FONTNAME_FS_S="Sans"
  export B_SRC_BASE_URL=$SRC_SansCJK_URL  
  if [ $BUILD_FONT_LANG_HK -eq 1 ]
  then
      echo "BUILD FONT LANG- HK"
      export B_FONT_LANG="HK"
      export B_FONT_LANG_L="hk"
      export B_ZIP_FILE=$SansCJK_HK_ZIP
      export B_EXT_DIR=""
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_JP -eq 1 ]
  then
      echo "BUILD FONT LANG- JP"
      export B_FONT_LANG="JP"
      export B_FONT_LANG_L="jp"
      export B_ZIP_FILE=$SansCJK_JP_ZIP
      export B_EXT_DIR=""
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR

  fi 
  echo ""
    
  if [ $BUILD_FONT_LANG_KR -eq 1 ]
  then
      echo "BUILD FONT LANG- KR"
      export B_FONT_LANG="KR"
      export B_FONT_LANG_L="kr"
      export B_ZIP_FILE=$SansCJK_KR_ZIP
      export B_EXT_DIR=""
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR
      
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_SC -eq 1 ]
  then
      echo "BUILD FONT LANG- SC"
      export B_FONT_LANG="SC"
      export B_FONT_LANG_L="sc"
      export B_ZIP_FILE=$SansCJK_SC_ZIP
      export B_EXT_DIR=""
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR    
  fi
  echo "" 
  
  if [ $BUILD_FONT_LANG_TC -eq 1 ]
  then
      echo "BUILD FONT LANG- TC"
      export B_FONT_LANG="TC"
      export B_FONT_LANG_L="tc"
      export B_ZIP_FILE=$SansCJK_TC_ZIP
      export B_EXT_DIR=""
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR
  fi
  echo ""
  echo "BUILD FONT - NOTO SANS CJK END"   
fi
echo "#####"
echo ""

if [ $BUILD_FONT_FS_SANSMONO -eq 1 ]
then
  echo "BUILD FONT - NOTO SANS MONO CJK START"
  export B_FONTNAME_FS="Sans Mono"
  export B_FONTNAME_FS_S="SansMono"
  export B_SRC_BASE_URL=$SRC_SansMonoCJK_URL
    
  if [ $BUILD_FONT_LANG_HK -eq 1 ]
  then
      echo "BUILD FONT LANG- HK"
      export B_FONT_LANG="HK"
      export B_FONT_LANG_L="hk"
      export B_ZIP_FILE=$SansMonoCJK_HK_ZIP
      export B_EXT_DIR=""
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_JP -eq 1 ]
  then
      echo "BUILD FONT LANG- JP"
      export B_FONT_LANG="JP"
      export B_FONT_LANG_L="jp"
      export B_ZIP_FILE=$SansMonoCJK_JP_ZIP
      export B_EXT_DIR=""
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR    
  fi 
  echo ""
    
  if [ $BUILD_FONT_LANG_KR -eq 1 ]
  then
      echo "BUILD FONT LANG- KR"
      export B_FONT_LANG="KR"
      export B_FONT_LANG_L="kr"
      export B_ZIP_FILE=$SansMonoCJK_KR_ZIP
      export B_EXT_DIR=""
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_SC -eq 1 ]
  then
      echo "BUILD FONT LANG- SC"
      export B_FONT_LANG="SC"
      export B_FONT_LANG_L="sc"
      export B_ZIP_FILE=$SansMonoCJK_SC_ZIP
      export B_EXT_DIR=""
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR
  fi
  echo "" 
  
  if [ $BUILD_FONT_LANG_TC -eq 1 ]
  then
      echo "BUILD FONT LANG- TC"
      export B_FONT_LANG="TC"
      export B_FONT_LANG_L="tc"
      export B_ZIP_FILE=$SansMonoCJK_TC_ZIP
      export B_EXT_DIR=""
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR
  fi
  echo ""
  echo "BUILD FONT - NOTO SANS MONO CJK END"  
fi
echo "#####"
echo ""

if [ $BUILD_FONT_FS_SERIF -eq 1 ]
then
  echo "BUILD FONT - NOTO SERIF CJK START"
  export B_FONTNAME_FS="Serif"
  export B_FONTNAME_FS_S="Serif"
  export B_SRC_BASE_URL=$SRC_SerifCJK_URL
  
  if [ $BUILD_FONT_LANG_HK -eq 1 ]
  then
      echo "BUILD FONT LANG- HK"
      export B_FONT_LANG="HK"
      export B_FONT_LANG_L="hk"
      export B_ZIP_FILE=$SerifCJK_HK_ZIP
      export B_EXT_DIR="OTF/TraditionalChineseHK/"
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_JP -eq 1 ]
  then
      echo "BUILD FONT LANG- JP"
      export B_FONT_LANG="JP"
      export B_FONT_LANG_L="jp"
      export B_ZIP_FILE=$SerifCJK_JP_ZIP
      export B_EXT_DIR="OTF/Japanese/"
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR

  fi 
  echo ""
    
  if [ $BUILD_FONT_LANG_KR -eq 1 ]
  then
      echo "BUILD FONT LANG- KR"
      export B_FONT_LANG="KR"
      export B_FONT_LANG_L="kr"
      export B_ZIP_FILE=$SerifCJK_KR_ZIP
      export B_EXT_DIR="OTF/Korean/"
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR
      
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_SC -eq 1 ]
  then
      echo "BUILD FONT LANG- SC"
      export B_FONT_LANG="SC"
      export B_FONT_LANG_L="sc"
      export B_ZIP_FILE=$SerifCJK_SC_ZIP
      export B_EXT_DIR="OTF/SimplifiedChinese/"
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR
      
  fi
  echo "" 
  
  if [ $BUILD_FONT_LANG_TC -eq 1 ]
  then
      echo "BUILD FONT LANG- TC"
      export B_FONT_LANG="TC"
      export B_FONT_LANG_L="tc"
      export B_ZIP_FILE=$SerifCJK_TC_ZIP
      export B_EXT_DIR="OTF/TraditionalChinese/"
      echo "build-font-fs-lang.sh \"$B_FONTNAME_FS\" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR"
      build-font-fs-lang.sh "$B_FONTNAME_FS" $B_FONTNAME_FS_S $B_FONT_LANG $B_FONT_LANG_L $B_ZIP_FILE $B_SRC_BASE_URL $B_EXT_DIR
      
  fi
  echo ""
  echo "BUILD FONT - NOTO SERIF CJK END" 
fi
echo "#####"
echo ""
