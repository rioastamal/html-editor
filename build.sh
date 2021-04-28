#!/bin/bash
#
# @desc Generate single file index.html of HTML editor
# @author Rio Astamal <rio@rioastamal.net>
# @link https://github.com/rioastamal/html-editor
#
[ ! -f src/lib/codemirror.js ] && {
    echo "Error: Make sure you run this script on root directory of html-editor." >&2
    exit 1
}

JS_CONTENTS=$( cat src/lib/codemirror.js )
CSS_CONTENT=
BUILD_FILE=build/index.html
APP_VERSION=1.3

cp src/index.html $BUILD_FILE

sed -i "" "s/{{APP_VERSION}}/${APP_VERSION}/g" $BUILD_FILE

# Update meta tag
[ -z "$META_DESCRIPTION" ] && {
    META_DESCRIPTION="A small and lighting fast in-browser HTML editor with real-time preview. A great tool for prototyping HTML code right inside your browser."
}
[ -z "$META_KEYWORDS" ] && {
    META_KEYWORDS="html editor, javascript editor, html, javascript, editor"
}
[ -z "$OG_TITLE" ] && {
    OG_TITLE="Small and Fast in-browser HTML Editor"
}
[ -z "$OG_DESCRIPTION" ] && {
    OG_DESCRIPTION=$META_DESCRIPTION
}
[ -z "$OG_URL" ] && {
    OG_URL="https://rioastamal.net/html-editor/"
}
[ -z "$OG_IMAGE" ] && {
    OG_IMAGE="https://rioastamal-assets.s3.amazonaws.com/html-editor/html-editor-og-url.png"
}

for keyword in META_DESCRIPTION META_KEYWORDS OG_TITLE OG_DESCRIPTION OG_URL OG_IMAGE
do
    TMP_VALUE=$( eval echo \$${keyword} )
    sed -i "" "s@{{$keyword}}@$TMP_VALUE@g" $BUILD_FILE
done

# Replace javascript file inclusion with inline javascript,
# so the ouput is only single HTML file
CODEMIRROR_LINE_BEGIN=$( sed -n '/!-- BEGIN CODEMIRROR -->/=' $BUILD_FILE )
CODEMIRROR_LINE_END=$( sed -n '/!-- END CODEMIRROR -->/=' $BUILD_FILE )
CONTENTS_BEFORE_CODEMIRROR=$( head -n $CODEMIRROR_LINE_BEGIN $BUILD_FILE )
CONTENTS_AFTER_CODEMIRROR=$( tail +$CODEMIRROR_LINE_END $BUILD_FILE )

for js in src/mode/*.js
do
    JS_CONTENTS="${JS_CONTENTS}
// --- File: $js
$( cat $js )
"
done

for css in src/css/*.css
do
    CSS_CONTENTS="${CSS_CONTENTS}
/* --- File: $css ---*/
$( cat $css )
"
done

echo "$CONTENTS_BEFORE_CODEMIRROR" > $BUILD_FILE
echo "<script>$JS_CONTENTS</script>" >> $BUILD_FILE
echo "<style>$CSS_CONTENTS</style>" >> $BUILD_FILE
echo "$CONTENTS_AFTER_CODEMIRROR" >> $BUILD_FILE

echo "Build file $BUILD_FILE complete."