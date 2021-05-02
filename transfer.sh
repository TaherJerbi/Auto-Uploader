. ~/.bashrc
echo "getting links ..."
sh getLinks.sh folders
echo "comparing links ..."
sh compareLinks.sh
echo "NEW VIDEOS : "
echo "----------------------"
cat newvids
echo "----------------------"
mkdir tmp
echo "Downloading file..."
sh download.sh newvids
echo "Uploading file..."
sh upload.sh videos
rm -rf ./tmp
rm videos
echo "Done transfering"
