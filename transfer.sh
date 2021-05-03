. ~/.bashrc
echo "getting links ..."
sh getLinks.sh folders
echo "comparing links ..."
sh compareLinks.sh
echo "NEW VIDEOS : "
echo "----------------------"
cat newvids
echo "----------------------"
echo "Downloading file..."
sh download.sh newvids
echo "Uploading file..."
sh upload.sh videos
rm -rf ./tmp
rm videos
rm oldLinks
mv links oldLinks
echo "Done transfering"
