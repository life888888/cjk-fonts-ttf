# -*- coding: utf-8 -*-
# -----------------------------------------------------------------------------
#
#  TTF Rename for Fontforge  - Copyright 2022 life888888
#
#  Distributed under the terms of the MIT license.
#
#  Modify From cjk-multi-fix.py the new BSD license. - Copyright 2017 Hin-Tak Leung
#
#  Usage:
#    fontforge -script ttf-rename.py oldname newname font.familyname font.fullname font.fontname
#
#  Example:
#    fontforge -script ttf-rename.py \
#      NotoSansCJKtc-BoldItalic.ttf NotoSansCJKtc-BoldItalic_NEW.ttf \
#      "Noto Sans CJK TC" "Noto Sans CJK TC Bold Italic" "NotoSansCJKTC-BoldItalic"
#
#  Limit:
#     Only Rename Language English fontname, familyname, style
#     Not set Language Chinese/JP/KR fontname, familyname, style
# 
# -----------------------------------------------------------------------------
import fontforge
#print(sys.path)
from freetype import Face
import time
import locale

if ( fontforge.version() < "20071105" ):
    print( "Can't use FontForge version before 2007-11-05.  Aborting." )
    exit(1)

if ( len(sys.argv) < 3 ):
    print( "usage: [fontforge -script] ", sys.argv[0], " oldname newname font.familyname font.fullname font.fontname" )
    exit(1)

# Use freetype-py to remember the cmap:
face = Face(sys.argv[1])
face.set_charmap( face.charmap )
reverse_lookup = {}
charcode, gindex = face.get_first_char()
codes = []
while ( gindex ):
    codes.append(charcode)
    if ( gindex in reverse_lookup.keys() ):
        reverse_lookup[gindex].append( charcode )
    else:
        reverse_lookup[gindex] = [charcode]
    charcode, gindex = face.get_next_char( charcode, gindex )
del face
# first block of freetype-py code ends.

print("Loading ", sys.argv[1], "...")
font = fontforge.open(sys.argv[1])

print( "ORIGINAL font.familyname = " , font.familyname  )  # None
print( "ORIGINAL font.fullname = " , font.fullname  ) # None
print( "ORIGINAL font.fontname = " , font.fontname  ) # NotoSerifCJKjp-Bold-Alphabetic
print( "ORIGINAL font.weight = " , font.weight  ) # None

# sys.argv[3] font.familyname =  Noto Serif
# sys.argv[4] font.fullname =  Noto Serif Italic
# sys.argv[5] font.fontname =  NotoSerif-Italic


if ( len(sys.argv) >= 4 ):
    font.familyname = sys.argv[3]

if ( len(sys.argv) >= 5 ):
    font.fullname = sys.argv[4]

if ( len(sys.argv) >= 6 ):
    font.fontname =  sys.argv[5] 

print( "NEW font.familyname = " , font.familyname  )  # None
print( "NEW font.fullname = " , font.fullname  ) # None
print( "NEW font.fontname = " , font.fontname  ) # NotoSerifCJKjp-Bold-Alphabetic
print( "    font.weight = " , font.weight  ) # None

# print( "len cidfontname =", len(font.cidfontname))
# print( "font.cidfontname =", font.cidfontname)

# if ( font.cidfontname != "" ):
#    font.cidFlatten()

font.reencode("ucs4")

duplicate_count = 0
# 2nd block of freetype-py code:
for gindex in reverse_lookup.keys():
    if ( len(reverse_lookup[gindex]) > 1 ):
        for x in range( len(reverse_lookup[gindex]) - 1 ):
            font.selection.select( reverse_lookup[gindex][-1] )
            if ( not (font[reverse_lookup[gindex][-1]]).isWorthOutputting() ):
                print( 'Source Empty!' )
            font.copy()
            font.selection.select( reverse_lookup[gindex][x] )
            try:
                font[reverse_lookup[gindex][x]]
            except TypeError:
                # expect this!
                pass
            else:
                print( 'Destination Full!' )
            font.paste()
            #print( "copy %d to %d" % (reverse_lookup[gindex][-1], reverse_lookup[gindex][x]) )
            duplicate_count += 1
# 2nd block of freetype-py code ends.

if (duplicate_count > 0):
    print( "Duplicated %d glyphs because some glyph map to multiple code points." % duplicate_count )
glyph_count = sum(1 for _ in font.glyphs())
print( "glyph count = %d" % glyph_count )

# Reserve 2 for .null and CR/nonmarkingreturn, up to opentype 1.7 or fontforge 20220308
excess = glyph_count - 65535 + 2
if (excess > 0):
    print( "***Unfortunately glyph count > 65535... we'll need to delete %d glyphs.***" % excess )
    print( "***Deleting %d glyphs from unicode 0x%06Xu to 0x%06Xu.***" % (excess, codes[-excess], codes[-1]) )
    for charcode in (codes[-excess:]):
        #print( "removing charcode %d" % charcode)
        font.selection.select(charcode)
        font.clear()

    print( "New glyph count = %d" % sum(1 for _ in font.glyphs()) )
font.selection.all()

font.generate(sys.argv[2])

font.close()
