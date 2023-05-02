# Kiwix

Education software that uses `.zim` files as a source.

You can find new content at https://library.kiwix.org/. We provide two ways of 
adding the content into your installation.

1. Download ZIMs using transmission at `torrent.{your-domain}`. Once the file
   is downloaded then run the playbook again (with `-e install=kiwix` to run only this role).
   Note that the files will remain even after you removed them from the torrent client
   because transmission deletes only the torrent files not the data files. Unfortunatelly,
   you need to remove the data files manually if you want to free up some space.

2. Copy manually ZIM files into `{project_root}/kiwix/data/`. Then run the playbook
   again (with `-e install=kiwix` to run only this role). The ZIMs stay there until
   you manully remove them from the data folder.