# Use Python base image
FROM python:3.10-slim

# Ensure all system packages are up-to-date to reduce vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    gcc \
    && pip install --no-cache-dir --upgrade pip \
    && apt-get purge -y --auto-remove gcc \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /app

# Install dependencies (if you have requirements.txt)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all code
COPY . .

# Default command (can be overridden)
CMD ["python", "app/main.py"]
