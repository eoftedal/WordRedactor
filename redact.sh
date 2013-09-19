#!/bin/bash


BASEDIR=$(dirname $0)
CURDIR=$(pwd)
TMPDIR=$(mktemp -d "$1.XXXXXX")

cd "$TMPDIR"

echo "Opening document $1"
unzip -o -q "$CURDIR/$1"

echo "Removing text and swithing to black background..."
xsltproc $BASEDIR/readact.xslt "word/document.xml" > "word/document2.xml"


rm "word/document.xml"
mv "word/document2.xml" "word/document.xml"

if [ -f "word/comments.xml" ]; then
	echo "Removing comments..."
	xsltproc $BASEDIR/comments.xslt "word/comments.xml" > "word/comments2.xml"
	rm "word/comments.xml"
	mv "word/comments2.xml" "word/comments.xml"
fi

OUTFILE="${1%.docx}-redacted.docx"

if [ -f "$CURDIR/$OUTFILE" ]; then
    rm "$CURDIR/$OUTFILE"
fi
echo "Writing to $OUTFILE"
zip -qr "$CURDIR/$OUTFILE" *
cd ..
rm -rf "$TMPDIR"


