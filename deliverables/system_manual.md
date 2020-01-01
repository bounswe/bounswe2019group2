# Traiders System Manual
This document describes how to build, configure and deploy TrAiders's web services. 

## Requirements
* [Docker](https://docs.docker.com/install/)
* [docker-compose](https://docs.docker.com/compose/install/)
* [git](https://git-scm.com/)

## Configuration
TrAider's services are configured by using an environment file. 
Create an empty file under your home directory with the name `traiders_prod_env`. 
### Parameters
* **SECRET_KEY**: A sequence of characters that is used for securing sensitive information. 
Make sure it is at least 50 characters long and kept secret.
* **ALPHA_VANTAGE_KEYS**: A comma separated list of [AlphaVantage](https://www.alphavantage.co/) API keys.
If you add more than one keys, the system automatically scales up to support more parities. 
* **EMAIL_PASSWORD**: [SendGrid](https://sendgrid.com/) API key. 
* **GOOGLE_OAUTH_ID**: Google OAuth ID. 
* **GOOGLE_OAUTH_SECRET**: Google OAuth Secret.

Google OAuth ID and Secret should be created on http://console.developers.google.com.

An example environment file should look like this:
```
SECRET_KEY=sdK1iONjl3WYtdpriLniqVkoIMz6fFo1E7S1yh2UfjlKcuNkiwYPZf7nhTpQUIV4
ALPHA_VANTAGE_KEYS=VDVRICLYITWLZAJI
EMAIL_PASSWORD=XZWQy0DDJDquRqNn.l7fhnhwLmoI1lldsbnvhLfLRM628MZKUau1CduwJF3.xu8nD4Ojl
GOOGLE_OAUTH_ID=885569868037-6irtdcclm633kocml09yck0yzp77boxt.apps.googleusercontent.com
GOOGLE_OAUTH_SECRET=AhloDHEOJ7gABXt_00BGCRjq
```

## How to Build & Deploy

### 1. Clone the repository and navigate to the sources root.
```bash
git clone https://github.com/bounswe/bounswe2019group2
cd bounswe2019group2/traiders
```

### 2. Build & run
```bash
docker-compose up -d --build
```

### 3. Restore content from database dumps
```bash
docker exec traiders_db_1 psql -U postgres -d postgres < db-dumps/traiders_db.sql
docker exec traiders_annotation_db_1 psql -U postgres -d postgres < db-dumps/traiders_annotation_db.sql
```
