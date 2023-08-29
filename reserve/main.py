import requests
import yadisk
from progress.bar import IncrementalBar
import json
from VK import VK



print("Please follow this link to authorize: https://oauth.vk.com/authorize?client_id=51735575&scope=65536&response_type=token")

# Getting data from user
vk_id = input("Enter VK user_id: ").strip()
vk_token = input("Enter VK access_token: ").strip()
yadisk_token = input("Enter yadisk token: ").strip()

# Defaults
number_of_photos = 5
yadisk_folder_name = vk_id

# Setting up yadisk folder
disk = yadisk.YaDisk(token=yadisk_token)
if not disk.is_dir(yadisk_folder_name):
    disk.mkdir(yadisk_folder_name)

# Getting photo data from VK
vk = VK(vk_token,vk_id)
photo_data = vk.get_photos()

# Checking if there's enough photos
if len(photo_data) < number_of_photos:
    number_of_photos = len(photo_data)

# Photo upload section
uploaded_photos = [] # uploads summary dict
progress_bar = IncrementalBar('Загружаю фотографии: ', max = number_of_photos)

for photo in range(number_of_photos):
    progress_bar.next()

    # Setting up photo details

    # Taking number of likes as name
    photo_name = f'{photo_data[photo]["likes"]["count"]}.jpg' 

    # Taking the largest available size
    photo_url = photo_data[photo]["sizes"][-1]["url"]

    # Saving size name for summary
    photo_size = photo_data[photo]["sizes"][-1]["type"]

    # If the number of likes matched -> adding upload date to the name 
    if not filter(lambda d: d['file_name'] in photo_name, uploaded_photos):
        photo_name = f'{photo_name}-{photo_data[photo]["date"]}.jpg'
    
    # Downloading the photo
    photo = requests.get(photo_url)

    # Saving the photo to Yadisk and local
    with open(photo_name, mode="wb") as file:
        file.write(photo.content)
    disk.upload(photo_name,f"{yadisk_folder_name}/{photo_name}")

    # Updating the summary
    uploaded_photos.append({"file_name": photo_name, "size": photo_size})
    
progress_bar.finish()

#Saving the summary to json file
with open("upload.json", "w") as summary:
    json.dump(uploaded_photos, summary, indent=4)