BookRead

A book review website where users can:

- Write local book reviews
- Browse the book catalogue
- Store reviews in a database
- Register for an account *(planned feature)*

## Requirements

- Python 3.10 or newer
- MySQL or MariaDB

## Setup

### 1. Create a virtual environment

```bash
python3 -m venv venv
source venv/bin/activate
```

### 2. Install dependencies

```bash
pip3 install -r requirements.txt
```

### 3. Create the database

```bash
mysql -u root < database/schema.sql
```

### 4. Create environment variables

Create a `.env` file in the project root:

```env
DB_HOST=localhost
DB_USER=root
DB_PORT=3306
DB_PASSWORD=
DB_NAME=book_review
```

Update these values to match your local database configuration.

### 5. Run the application

```bash
python3 app.py
```

## `.gitignore`

Create a `.gitignore` file in the project root so that virtual environments,
environment variables, and Python cache files are not committed:

```gitignore
venv/
.env
__pycache__/
*.py[cod]
```

## Author

Created by [@AbdiRaqiibMohummed](https://github.com/AbdiRaqiibMohummed).
