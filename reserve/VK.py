import requests
class VK:

    def __init__(self, access_token, user_id, version='5.131'):
        self.token = access_token
        self.id = user_id
        self.version = version
        self.params = {'access_token': self.token, 'v': self.version}

    def get_photos(self,album_id='profile',extended='1',photo_sizes='1'):
        url = 'https://api.vk.com/method/photos.get'
        params = {"album_id": album_id, "extended": extended, "owner_id": self.id, "photo_sizes":photo_sizes}
        response = requests.get(url, params={**self.params, **params})
        data = response.json()
        return data["response"]["items"]

       
