# output the missing links from oldLinks to newvids
while IFS='' read -r LINE || [ -n "${LINE}" ]; do
    if ! grep -q "$LINE" oldLinks; then
        echo $LINE >> newvids
    fi
done < links