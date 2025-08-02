FROM python:3.8-slim-bullseye

WORKDIR /app
COPY . /app

# Install system dependencies (only if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --default-timeout=1000000 -r requirements.txt

# Use gunicorn to run the Flask app
CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "app:app"]
