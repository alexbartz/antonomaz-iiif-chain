rm -rf temp
rm -rf out_tiff
mkdir -p temp
mkdir -p out_tiff

for f in ./in_pdf/*.pdf
do
    bnf=$(basename $f)
    id=${bnf/.*/}
    echo $id
    mkdir -p temp/$id
    cd temp/$id
    pdfimages ../../$f -tiff $id
    cd ../..
done

cd temp
for d in *
do
    cd $d
    mkdir -p trash
    rm $d-000.tif
    mv `\ls -l *.tif |awk '{ if(!($5 >1000000 && $5<5000000 )) print $9 }'` trash/
    cd ..
done
cd ..

for d in ./temp/*
do
    echo $d
    i=0
    for f in $d/*.tif
    do
        i=$((i+1))
        id=$(basename $d)
        n=`printf '%03d' "$i"`
        nf=$id-$n.tif
        filename="${nf%.*}"
        mv $f ./out_tiff/$filename
    done
done

rm -rf temp
