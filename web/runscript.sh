psql --command "CREATE USER rd WITH PASSWORD 'test1234';"
psql --command "CREATE DATABASE rentdynamics WITH OWNER rd;"
psql --command "CREATE DATABASE rentplus WITH OWNER rd;"
psql --command "ALTER USER rd WITH SUPERUSER;"

cd /root/code/
# pip install --no-cache-dir -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python manage.py runserver 0:8000
