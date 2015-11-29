# slimdb

# Preparation

## Dependencies

 - PostgreSQL server and client libraries (tested with version 9.4).
 - Python 2.x (tested with 2.7.10, probably won't work with anything less than 
   2.7).
 - `pip` (the `python-pip` package in Debian)

## Setup

 - Create a new PostgreSQL user and database:

   ```
   sudo su - postgres
   createuser slimdb -P # enter password here
   createdb -E UTF-8 -T template0 -O slimdb slimdb
   ```
 - Update the database name, username and password in `slim/app/config.py`.
 - Initialize the database schema:
   ```
   psql -d "dbname=slimdb user=slimdb password=..." < base_schema.sql
   ```
 - Install the Python dependencies:

   ```
   pip install -r requirements.txt
   ```

# Loading the datasets

```
./load_data.py "dbname=slimdb user=slimdb password=slimdb"
```

# Running the web application

## Disclaimer

**This application has been written quickly and without significant
testing or attention to security. Have it reviewed by a competent Web
programmer before exposing it to the public Internet.**

## Local server (testing)

```
python2 -m slim.app
```

## Production

Again, get this reviewed by a competent Web programmer before
deploying on the public Internet. A popular choice of application
server for deployment is [flup](https://pypi.python.org/pypi/flup).