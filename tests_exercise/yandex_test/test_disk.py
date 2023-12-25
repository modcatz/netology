import pytest
import requests as r

# DON'T FORGET TO ADD TOKEN
access_token="Insert your oauth token here"
folder="test_folder"
base_url="https://cloud-api.yandex.net/v1/disk/resources?path="

@pytest.fixture
def output(oauth_token,folder_name):
    headers = {"Authorization": f"OAuth {oauth_token}"}
    reply = r.put(f"{base_url}{folder_name}", headers=headers)
    print(reply.json())
    yield reply
    cleanup = r.delete(f"{base_url}{folder}", headers=headers)

@pytest.mark.parametrize("oauth_token,folder_name",[(access_token,folder)])
def test_success_status_code(output):
    '''Checks if folder is created succesfully'''

    assert output.status_code == 201

@pytest.mark.parametrize("oauth_token,folder_name",[(access_token,folder)])
def test_folder_exists(output):
    '''Checks if folder exists after creation'''
 
    headers = {"Authorization": f"OAuth {access_token}"}
    reply = r.get(f"{base_url}{folder}", headers=headers)

    assert reply.status_code == 200

@pytest.mark.parametrize("oauth_token,folder_name",[(access_token,"")])
def test_wrong_name(output):
    '''Checks error for empty folder name'''

    assert output.status_code == 400

@pytest.mark.parametrize("oauth_token,folder_name",[("blabla",folder)])
def test_wrong_creds(output):
    '''Checks error for wrong token'''

    assert output.status_code == 401

