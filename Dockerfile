FROM python:3.8-slim-bullseye

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y

RUN pip install --default-timeout=1000000 -r requirements.txt


CMD ["python3", "app.py"]
