FROM python:3.8-slim-bullseye

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
