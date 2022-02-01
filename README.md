# secufaku
This is a sample project needed for a security course to "connect web service to database".

## Why this project suits alignment purpose
It connects to the PostgreSQL database with basic authentication. 
On this web server, you can make a gateway with Nginx It would be better if you do it in the 
docker network so web app would not have internet access, and it would be a true gateway. 
But easier is to send requests to localhost:8000 from Nginx.

## How to start web app
It would be much easier with docker. Just run `docker compose up` (or `docker-compose up` if you have an older version).
The server will start on `http://localhost:8000`, and it will be also available from the network. If you want to disable it 
just modify `Dockerfile` in the last row from `0.0.0.0:8000` to `localhost:8000`, and rebuild containers if you started them 
already `docker compose up --build`.

## How to log in admin panel
`localhost:8000/admin` - authentication page
![Screenshot 2022-01-31 at 21 50 16](https://user-images.githubusercontent.com/54911879/151866284-2060a710-dfb4-45f7-b6ff-be8eaab667a0.jpg)
You need to enter the container and create user (you can see how to do this on screenshot)


### Also, you can install manually
```
pip install poetry
poetry install
# start database
# modify src/secufaku/settings.py and set user, password for database
python src/manage.py runserver 0.0.0.0:8000
```

## Configuration
You are recommended to modify `docker-compose.yml` environment variables for the database and in python block too.


### Notice
Since I was in hurry and was not in a mood to fix static files in docker. Please don't judge me for that 😅.
You can do this if you want. Just make a pull request!
