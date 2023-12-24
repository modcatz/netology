import requests
import json
from bs4 import BeautifulSoup
from first import logger

baseurl = "https://hh.ru/"
search_url = "https://hh.ru/search/vacancy?text=python&area=1&area=2&only_with_salary=true"

#otherwise 404
header = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)'}
scraped_vacancies = []

@logger
def scrape(url,fullSearch=False):
    search_html = requests.get(url, headers=header)
    soup = BeautifulSoup(search_html.text, 'html.parser')
    next_page = soup.find(attrs={"data-qa":"pager-next"})

    vacancy_links = soup.find_all("a", class_='serp-item__title')

    for link in vacancy_links:
        scraped = {}
        vacancy_html = requests.get(link['href'], headers=header)
        soup = BeautifulSoup(vacancy_html.text, 'html.parser')

        description = str(soup.find(attrs={"data-qa":"vacancy-description"})).lower()

        if "django" in description or "flask" in description:
            scraped["url"] = link['href'].split('?', 1)[0]
            scraped["salary"] = soup.find(attrs={"data-qa":"vacancy-salary"}).getText()
            scraped["employer"] = soup.find(attrs={"data-qa":"vacancy-company-name"}).getText()
            check_address = soup.find(attrs={"data-qa":"vacancy-view-raw-address"})
            if check_address != None:
                scraped["city"] = check_address.getText().split(',', 1)[0]
            else:
                scraped["city"] = soup.find(attrs={"data-qa":"vacancy-view-location"}).getText()    
            scraped_vacancies.append(scraped)
        with open("scraped_vacancies.json", "w+") as file:
            json.dump(scraped_vacancies, file, ensure_ascii=False, indent=4) 

    if next_page != None and fullSearch == True:
        next_url = baseurl + next_page['href']
        scrape(next_url,fullSearch=True)


# switch fullSearch to True to scrape all pages. It works but takes a lot of time :) 
scrape(search_url,fullSearch=False)




        
        