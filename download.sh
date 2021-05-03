while IFS='\n' read -r LINE || [ -n "${LINE}" ]; do
   wget --cookies=on --load-cookies cookies.txt --keep-session-cookies --no-check-certificate -m "${LINE}" 
done < $1

find . -name "*.mp4" > videos
