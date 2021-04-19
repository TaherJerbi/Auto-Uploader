. ~/.bashrc
mkdir tmp
echo "Downloading file..."
wget --cookies=on --load-cookies cookies.txt --keep-session-cookies --no-check-certificate -P ./tmp -m $1
find ./tmp -name "*.mp4" > video
echo "Uploading file..."
sh upload.sh video
rm -rf ./tmp
rm video
echo "Done transfering"
