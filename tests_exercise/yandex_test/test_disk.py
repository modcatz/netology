import pytest
import requests as r

# DON'T FORGET TO ADD TOKEN
access_token="Insert your oauth token here"
folder="test_folder"
base_url="https://cloud-api.yandex.net/v1/disk/resources?path="

@pytest.fixture
def create_folder(oauth_token,folder_name):
    headers = {"Authorization": f"OAuth {oauth_token}"}
    reply = r.put(f"{base_url}{folder_name}", headers=headers)
    print(reply.json())
    yield reply
    cleanup = r.delete(f"{base_url}{folder}", headers=headers)

@pytest.mark.parametrize("oauth_token,folder_name",[(access_token,folder)])
def test_success_status_code(create_folder):
    '''Checks if folder is created succesfully'''

    assert create_folder.status_code == 201

@pytest.mark.parametrize("oauth_token,folder_name",[(access_token,folder)])
def test_folder_exists(create_folder):
    '''Checks if folder exists after creation'''
 
    headers = {"Authorization": f"OAuth {access_token}"}
    reply = r.get(f"{base_url}{folder}", headers=headers)

    assert reply.status_code == 200

@pytest.mark.parametrize("oauth_token,folder_name",[(access_token,"")])
def test_wrong_name(create_folder):
    '''Checks error for empty folder name'''

    assert create_folder.status_code == 400

@pytest.mark.parametrize("oauth_token,folder_name",[("blabla",folder)])
def test_wrong_creds(create_folder):
    '''Checks error for wrong token'''

    assert create_folder.status_code == 401

