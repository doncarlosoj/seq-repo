FROM python:alpine
# Update OS packages to latest versions to reduce vulnerabilities
RUN apk update && apk upgrade
WORKDIR /app
COPY . /app
# Install security updates and upgrade pip/setuptools/wheel
RUN apk add --no-cache gcc musl-dev && \
	pip install --upgrade pip setuptools wheel && \
	apk del gcc musl-dev
CMD ["python", "hello.py"]
# CMD ["python", "-m", "http.server", "8000"]
# EXPOSE 8000