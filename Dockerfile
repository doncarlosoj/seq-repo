FROM python:alpine

# Update OS packages to latest versions to reduce vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Install security updates and upgrade pip/setuptools/wheel
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends gcc && \
	pip install --upgrade pip setuptools wheel && \
	apt-get remove -y gcc && \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

CMD ["python", "hello.py"]
# CMD ["python", "-m", "http.server", "8000"]
# EXPOSE 8000