# output the missing links from oldLinks to newvids
while IFS='' read -r LINE || [ -n "${LINE}" ]; do
    if ! grep -q "$LINE" oldLinks; then
        link=`echo $LINE|xargs`
	echo "https://mohetn.sharepoint.com$link" >> newvids

    fi
done < links
