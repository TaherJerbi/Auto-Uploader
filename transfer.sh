. ~/.bashrc
mkdir tmp
echo "Downloading file..."
sh download.sh newvids
echo "Uploading file..."
sh upload.sh videos
rm -rf ./tmp
rm videos
echo "Done transfering"
