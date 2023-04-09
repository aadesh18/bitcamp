from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
import time
import psycopg2
import os


# Set the URL to scrape
url = "https://www.redfin.com/city/12839/DC/Washington-DC"

# Set up the headless browser
options = Options()
options.add_argument("--headless")
driver = webdriver.Chrome(options=options)
# Send a GET request to the URL and parse the HTML content with BeautifulSoup
driver.get(url)
time.sleep(5)
html = driver.page_source
soup = BeautifulSoup(html, "html.parser")
# Find all the listings on the page and extract the price
# listings = soup.find_all("div", class_="HomeCardsContainer flex flex-wrap")
listings = soup.find_all("div", class_="HomeCardContainer defaultSplitMapListView")
data = []

for listing in listings:
    try:
        slider = listing.find("div", class_="scrollable")
        img = slider.find('img', {'class': 'homecard-image'})
        # image = slider[1]
        try:
            image_link = img['src']
        except:
            image_link = img['data-src']
        price = listing.find("span", class_="homecardV2Price").text.strip()
        pre_bottom = listing.find("div", class_="v2 interactive")
        # bottom = pre_bottom.find("div", class_="bottomV2 ")
        remarks_div = pre_bottom.find('div', {'class': 'remarks'})
        # address = remarks_div.find('p').text
        stats = pre_bottom.find_all('div', {'class': 'stats'})
        # Extract the stats
        beds = stats[0].text.strip()
        baths = stats[1].text.strip()
        sq_ft = stats[2].text.strip()
        address = listing.find("span", class_="collapsedAddress primaryLine").text.strip()
        temp = [image_link, price, beds, baths, sq_ft, address]
        data.append(temp)
        # print("image link: ", image_link)
        # print("price: ", price)
        # print(beds, baths, sq_ft)
        # print("address: ", address)
    except:
        # print(img)
        continue
# Data Format (List of lists)(each nested list is data for a single property) -
# [[image_link, price, beds, baths, sq_ft, address], [same for next property], [same for next property] ....]


'''
    WRITING DATA INTO THE DATABASE
'''
db =  "postgresql://rishabh:EVW8P52hCOiPMVKYMRxteQ@property-data-3663.g8z.cockroachlabs.cloud:26257/properties?sslmode=verify-full"
conn = psycopg2.connect(db)

cur = conn.cursor()

cur.execute("DROP TABLE props")

cur.execute(
    "CREATE TABLE props (id STRING, img STRING, price STRING, beds STRING, bath STRING, sq_ft STRING, addr STRING)"
)

id = 0
for p in data:
    img = p[0]
    price = p[1]
    beds = p[2]
    bath = p[3]
    sq_ft = p[4]
    addr = p[5]

    cur.execute(
        "INSERT INTO props VALUES (%s, %s, %s, %s, %s, %s, %s)", 
        (id, img, price, beds, bath, sq_ft, addr)
    )
    
    id += 1

conn.commit()

## f = open("data.txt", "w")

# Read data from DB
sql_str = "SELECT id, img, price, beds, bath, sq_ft, addr FROM props"
cur.execute(sql_str)
rows = cur.fetchall()

print(rows)
## Write in file
# for row in rows:
#     f.write(str(row))
