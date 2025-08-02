FROM python:3.8-slim-bullseye

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y build-essential

RUN pip install --no-cache-dir -r requirements.txt


ENV PORT=5000
EXPOSE $PORT


CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
