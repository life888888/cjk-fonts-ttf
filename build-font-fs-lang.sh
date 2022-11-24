# build-font-fs-lang.sh input parameter
# $1 FONTNAME_FS EX:"Sans Mono" 
# $2 FONTNAME_FS_S EX: SansMono  
# $3 FONT_LANG EX: TC 
# $4 FONT_LANG_L EX: tc
# $5 ZIP_FILE EX: 14_NotoSansMonoCJKtc.zip 
# $6 SRC_BASE_URL EX: https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004 
# $7 EXT_DIR EX: 
# Usage:
#   build-font-fs-lang.sh "FONTNAME_FS" FONTNAME_FS_S FONT_LANG FONT_LANG_L ZIP_FILE SRC_BASE_URL EXT_DIR
#
# Example:
#   build-font-fs-lang.sh \
#          "Sans Mono" \
#          SansMono \
#          TC \
#          tc \
#          14_NotoSansMonoCJKtc.zip \
#          https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004 

# echo $APP_DIR
# echo $TOOL_SCRIPT_DIR

# export FONTNAME_FS="Sans Mono"
# export FONTNAME_FS_S=SansMono
export FONTNAME_FS="$1"
export FONTNAME_FS_S=$2

echo "FONTNAME_FS=$1"
echo "FONTNAME_FS_S=$2"

# export FONT_LANG=TC
# export FONT_LANG_L=tc
export FONT_LANG=$3
export FONT_LANG_L=$4

echo "FONT_LANG=$3"
echo "FONT_LANG_L=$4"

# export ZIP_FILE=14_NotoSansMonoCJKtc.zip
# export ZIP_FILE=$SerifCJK_HK_ZIP
export ZIP_FILE=$5
echo "ZIP_FILE=$5"

export SRC_BASE_URL=$6
echo "SRC_BASE_URL=$6"

export EXT_DIR=$7
echo "EXT_DIR=$7"

# export SRC_FILE_URL=https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004/14_NotoSansMonoCJKtc.zip
export SRC_FILE_URL=$SRC_BASE_URL/$ZIP_FILE

export LOCAL_CACHE_ZIP="$LOCAL_CACHE_DIR/$ZIP_FILE"
export OUTPUT_DIR=$RELEASES_DIR/$FONTNAME_FS_S/$FONT_LANG

echo "mkdir -p \"$OUTPUT_DIR\""
mkdir -p "$OUTPUT_DIR"

echo "CREATE TMP_DIR=$TMP_DIR"
export TMP_DIR=$(mktemp -d -t cjk-fonts-$(date +%Y%m%d%H%M%S)-XXXX)

# echo "mkdir $TMP_DIR"
# mkdir $TMP_DIR

export PATH=$TMP_DIR:$PATH

echo "COPY TOOL SCRIPTS TO $TMP_DIR"

echo "cp \"$TOOL_SCRIPT_DIR/cjk-multi-fix.py\" \"$TMP_DIR/\""
cp "$TOOL_SCRIPT_DIR/cjk-multi-fix.py" "$TMP_DIR/"

echo "cp \"$TOOL_SCRIPT_DIR/convert_italic.pe\" \"$TMP_DIR/\""
cp "$TOOL_SCRIPT_DIR/convert_italic.pe" "$TMP_DIR/"

# echo "cp \"$TOOL_SCRIPT_DIR/cjk-show-info.py\" \"$TMP_DIR/\" "
# cp "$TOOL_SCRIPT_DIR/cjk-show-info.py" "$TMP_DIR/"

echo "cp \"$TOOL_SCRIPT_DIR/ttf-rename.py\" \"$TMP_DIR/\""
cp "$TOOL_SCRIPT_DIR/ttf-rename.py" "$TMP_DIR/"


echo "chmod u+x \"$TMP_DIR/cjk-multi-fix.py\""
chmod u+x "$TMP_DIR/cjk-multi-fix.py"

echo "chmod u+x \"$TMP_DIR/convert_italic.pe\""
chmod u+x "$TMP_DIR/convert_italic.pe"

# echo "chmod u+x \"$TMP_DIR/cjk-show-info.py\""
# chmod u+x "$TMP_DIR/cjk-show-info.py"

echo "chmod u+x \"$TMP_DIR/ttf-rename.py\""
chmod u+x "$TMP_DIR/ttf-rename.py"

echo "cd \"$TMP_DIR\""
cd "$TMP_DIR"

echo "mkdir -p out-otf2ttf"
mkdir -p out-otf2ttf

echo "mkdir -p out-ttf"
mkdir -p out-ttf

echo "mkdir -p out-ttf-setname"
mkdir -p out-ttf-setname

echo "USE_LOCAL=$USE_LOCAL"
# TODO HERE
# SAVE_CACHE
# Default check cache zip is exist ?
# If Not Exist - download URL to cache zip
# If Exit - cp cache zip to TMP_DIR

if [ ! -f "$LOCAL_CACHE_ZIP" ]; then
    echo "$LOCAL_CACHE_ZIP does not exist."
    echo "DOWNLOAD $SRC_FILE_URL TO $LOCAL_CACHE_DIR"
    echo "wget -P \"$LOCAL_CACHE_DIR\" \"$SRC_FILE_URL\""
    wget -P "$LOCAL_CACHE_DIR" "$SRC_FILE_URL"
    sync
    sleep 1
    sync
fi


# IF USE_LOCAL !=0 (USE_LOCAL=1)
echo "COPY $LOCAL_CACHE_ZIP TO $TMP_DIR"
echo "cp \"$LOCAL_CACHE_ZIP\" \"$TMP_DIR/\" "
cp "$LOCAL_CACHE_ZIP" "$TMP_DIR/" 

sync
sleep 1
sync


echo ""
echo "UNZIP FILE $ZIP_FILE"
echo "unzip \"$ZIP_FILE\""
unzip "$ZIP_FILE"
echo ""

sync
sleep 1
sync

# Archive:  14_NotoSansMonoCJKtc.zip
#  inflating: NotoSansMonoCJKtc-Bold.otf  
#  inflating: NotoSansMonoCJKtc-Regular.otf  
#  inflating: LICENSE

echo "CONVERT otf to ttf"
echo "CONVERT Regular otf to ttf"
fontforge -script cjk-multi-fix.py ${B_EXT_DIR}Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Regular.otf out-otf2ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Regular.ttf
echo ""

echo "CONVERT Bold otf to ttf"
fontforge -script cjk-multi-fix.py ${B_EXT_DIR}Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Bold.otf out-otf2ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Bold.ttf
echo ""

sync
sleep 1
sync

echo "CONVERT TO Italic"
echo "CONVERT Regular to Italic"
convert_italic.pe out-otf2ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Regular.ttf
echo ""

echo "CONVERT Bold to BoldItalic"
convert_italic.pe out-otf2ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Bold.ttf
echo ""
sync
sleep 1
sync

# out-otf2ttf/NotoSansMonoCJKtc-Regular.ttf
# out-otf2ttf/NotoSansMonoCJKtc-Bold.ttf
# out-otf2ttf/NotoSansMonoCJKtc-Regular-Italic.ttf
# out-otf2ttf/NotoSansMonoCJKtc-Bold-Italic.ttf  

echo "MOVE AND RENAME TO out-ttf DIR"
mv out-otf2ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Regular.ttf out-ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Regular.ttf
mv out-otf2ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Bold.ttf out-ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Bold.ttf
mv out-otf2ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Regular-Italic.ttf out-ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Italic.ttf
mv out-otf2ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Bold-Italic.ttf out-ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-BoldItalic.ttf

sync
sleep 1
sync

echo "SET FONT NAME TO out-ttf-setname DIR"

echo "SET FONT NAME Regular"
fontforge -script ttf-rename.py out-ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Regular.ttf out-ttf-setname/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Regular.ttf \
  "Noto ${FONTNAME_FS} CJK ${FONT_LANG}" "Noto ${FONTNAME_FS} CJK ${FONT_LANG}" "Noto${FONTNAME_FS_S}CJK${FONT_LANG}"
echo ""

echo "SET FONT NAME Bold"
fontforge -script ttf-rename.py out-ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Bold.ttf out-ttf-setname/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Bold.ttf \
  "Noto ${FONTNAME_FS} CJK ${FONT_LANG}" "Noto ${FONTNAME_FS} CJK ${FONT_LANG} Bold" "Noto${FONTNAME_FS_S}CJK${FONT_LANG}-Bold"
echo ""

echo "SET FONT NAME Italic"
fontforge -script ttf-rename.py out-ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Italic.ttf out-ttf-setname/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Italic.ttf \
  "Noto ${FONTNAME_FS} CJK ${FONT_LANG}" "Noto ${FONTNAME_FS} CJK ${FONT_LANG} Italic" "Noto${FONTNAME_FS_S}CJK${FONT_LANG}-Italic"
echo ""

echo "SET FONT NAME BoldItalic"
fontforge -script ttf-rename.py out-ttf/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-BoldItalic.ttf out-ttf-setname/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-BoldItalic.ttf \
  "Noto ${FONTNAME_FS} CJK ${FONT_LANG}" "Noto ${FONTNAME_FS} CJK ${FONT_LANG} Bold Italic" "Noto${FONTNAME_FS_S}CJK${FONT_LANG}-BoldItalic"
echo ""

sync
sleep 1
sync


echo "MOVE out-ttf-setname/*.ttf to $OUTPUT_DIR/"
mv out-ttf-setname/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Regular.ttf "$OUTPUT_DIR/"
mv out-ttf-setname/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Bold.ttf "$OUTPUT_DIR/"
mv out-ttf-setname/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-Italic.ttf "$OUTPUT_DIR/"
mv out-ttf-setname/Noto${FONTNAME_FS_S}CJK${FONT_LANG_L}-BoldItalic.ttf "$OUTPUT_DIR/"
mv LICENSE $OUTPUT_DIR/

sync
sleep 1
sync

cd "$OUTPUT_DIR"
zip -r "$RELEASES_DIR/Noto${FONTNAME_FS_S}CJK-${FONT_LANG}.zip" *

sync
sleep 1
sync

echo "DONE!"

