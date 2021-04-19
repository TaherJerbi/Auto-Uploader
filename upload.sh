
while IFS='' read -r LINE || [ -n "${LINE}" ]; do
	gupload "${LINE}" -c "Youtube GL2"
done < $1
