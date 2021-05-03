# for each folder in the given file : folders => fetch all file paths and add them to file : links 
#https://mohetn.sharepoint.com/sites/GL2-UNIX/_api/Web/GetFolderByServerRelativePath(decodedurl='/sites/GL2-UNIX/Shared Documents/General/Recordings')/Files
server="mohetn.sharepoint.com"
# site=""
# path=""
# videoPath=""
# # Download all xml responses
while IFS='' read -r LINE || [ -n "${LINE}" ]; do

	site=`echo $LINE | cut -d/ -f5` 
    path=`echo $LINE | awk -F $server '{print $2}'`
    echo $server
    echo $site
    echo $path
    wget --cookies=on --load-cookies cookies.txt --keep-session-cookies --no-check-certificate -P ./tmp -m "https://$server/sites/$site/_api/Web/GetFolderByServerRelativePath(decodedurl='$path')/Files"
done < $1

# Parse to get links
# cat file.xml | xq . | grep d:ServerRelativeUrl | cut -d: -f 3 | cut -d, -f1 > links
find ./tmp -name 'Files*' > files

while IFS='' read -r line || [ -n "${line}" ]; do 
    cat "$line" | /home/azureuser/.local/bin/xq . | grep d:ServerRelativeUrl | cut -d: -f 3 | cut -d, -f1 | sed "s/\"//g" >> links
done <files
rm files
    
