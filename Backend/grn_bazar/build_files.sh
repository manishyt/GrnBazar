# build_files.sh
# Add this to your build_files.sh or vercel.json file
apt-get update
apt-get install -y libpq-dev

pip install -r requirements.txt

# make migrations
python3.9 manage.py makemigrations
python3.9 manage.py migrate 
python3.9 manage.py collectstatic
