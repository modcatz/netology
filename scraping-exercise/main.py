import requests as r
import json

api_url = "https://api.hh.ru/vacancies?text=python&area=1&area=2&only_with_salary=true"
scraped_vacancies = []

response = r.get(api_url)
data = json.loads(response.text)

def search(data):

    for vacancy in data["items"]:
        scraped = {}
        description = str(vacancy["snippet"].values()).lower()

        if "django" in description or "flask" in description:
            scraped["url"] = vacancy["alternate_url"]
            scraped["salary"] = f'{vacancy["salary"]["from"]} - {vacancy["salary"]["to"]}'
            scraped["employer"] = vacancy["employer"]["name"]
            scraped["city"] = vacancy["area"]["name"]
            scraped_vacancies.append(scraped)


if data["pages"] > 1:
    for page in range(1, data["pages"]):
        url_paged = f"{api_url}&page={page}"
        response = r.get(url_paged)
        data = json.loads(response.text)
        search(data)
else:
    search(data)

with open("scraped_vacancies.json", "w") as file:
    json.dump(scraped_vacancies, file, ensure_ascii=False, indent=4)        
    