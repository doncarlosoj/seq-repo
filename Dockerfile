# Use Python base image
FROM python:3.10.14-slim-bullseye

# Ensure all system packages are up-to-date to reduce vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get clean

# Set working directory inside the container
WORKDIR /app

# Install dependencies (if you have requirements.txt)
COPY requirements.txt .
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
	gcc \
	build-essential \
	&& pip install --no-cache-dir -r requirements.txt \
	&& apt-get purge -y --auto-remove gcc build-essential \
	&& rm -rf /var/lib/apt/lists/*

# Copy all code
COPY . .

# Default command (can be overridden)
CMD ["python", "app/main.py"]
