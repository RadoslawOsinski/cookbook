#!/bin/sh
#clear output dir
rm -R output;

#publish HTML
asciidoctor -b html5 -a icons -a toc2 -a theme=flask book/main.adoc -D output/html/;
rsync -zarv --include="*/" --include="*.jpg" --include="*.jpeg"  --include="*.png" --exclude="*" "book/" "output/html/"

#publish dockbook
#asciidoctor -b docbook --doctype book book/main.adoc -D output/docbook/;
#rsync -zarv --include="*/" --include="*.jpg" --include="*.jpeg"  --include="*.png" --exclude="*" "book/" "output/docbook/"

#publish pdf
asciidoctor -r asciidoctor-pdf -b pdf book/main.adoc -D output/pdf/;

#publish epub
#asciidoctor -r asciidoctor-epub3 -b epub3 book/main.adoc -D output/epub/;
#asciidoctor-epub3 book/main.adoc -D  output/ebook/;