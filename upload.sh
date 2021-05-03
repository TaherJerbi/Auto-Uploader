
while IFS='' read -r LINE || [ -n "${LINE}" ]; do
	/home/azureuser/.google-drive-upload/bin/gupload "${LINE}" -c "Youtube"
done < $1
