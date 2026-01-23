## Welcome to Book Review Website 
- Make local reviews
- Browse catalogs
- Store reviews
- Future implementation "registration"


## Requirements
- Python 3.10+
- MySQL or MariaDB


## Home page where you navigate accross multiple pages
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/6221ddc6-9044-4fe9-9647-5eaeb8dce8e6" />

## Browse page to either search or browse various books
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/1c368a94-eee0-4a98-bf92-9fb0a473ed32" />

## Review a book page by clicking on any book
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/37bfb388-12e7-44cf-9f46-dc3458ef2367" />

## All reviews made but in the future will only show the ones you bookmarked 
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/adc643c8-01e0-48b8-954d-f8ed15936155" />

## Login and signup pages for users and admins aswell as moderators to use in the future currently not working 
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/2597f528-cfb8-424e-8780-7bdf046913a5" />


## Setup
clone repo 
git clone https://github.com/AbdiRaqiibMohummed/BookReviewNewV1

```bash

1. Create virtual environment
python3 -m venv venv
source venv/bin/activate

2. Install Python dependencies
pip install -r requirements.txt

3. Create database
mysql -u root -p < schema.sql

4. Environment variables

Create a .env file:

DB_HOST=localhost
DB_USER=app_user
DB_PASSWORD=your_password
DB_NAME=book_review

5. Run the app
flask run  
# or cd book-review-app and then python3 app.py

---
## 6 .gitignore quite important

 **`.gitignore`**

```gitignore
venv/
.env
__pycache__/

# created by abdiraqiibhassan