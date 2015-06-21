output=output
src=src
img=${src}/img

titlebook="titlebook"
toc=--toc --toc-depth=2

all: clean epub

epub: mkdir cover
	pandoc -S -o ${output}/${titlebook}.epub\
		--epub-cover-image=${output}/cover.png \
		--epub-metadata=${src}/metadata.xml \
		${toc} \
		${src}/title.txt \
		${src}/*.md

cover: mkdir
	inkscape -e ${output}/cover.png ${img}/cover.svg

clean:
	[ ! -d ${output} ] || rm -r ${output}

mkdir:
	[ -d ${output} ] || mkdir -p ${output}

