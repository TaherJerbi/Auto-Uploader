
import json
while True:
    title = raw_input("Title :")
    link = raw_input("Link :")

    file_name = title.replace("(","")
    file_name = file_name.replace(")","")
    file_name+=".mp4"
    file_name = file_name.strip()

    print "Title : " + title
    print "File name : " + file_name 


    with open('videoList.json','r') as json_file:
        data = json.load(json_file)
        data["videos"].append({
            "Title":title,
            "Link":link
        })
    with open("videoList.json",'w') as json_file:
        json.dump(data,json_file) 
