for file in `ls /dump/private`
do
        mkdir -p /lokal/${file%.*} # create folder with name of file without suffix
        mv /dump/private/$file /lokal/${file%.*}/
done


for file in `ls /dump/certs`
do
        mkdir -p /lokal/${file%.*} # create folder with name of file without suffix
        mv /dump/certs/$file /lokal/${file%.*}/
done