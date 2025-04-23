# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install dependencies, including pytest for testing
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir pytest

# Set environment variables for database (only for testing, insecure)
ENV DB_HOST=crossover.proxy.rlwy.net \
    DB_PORT=58509 \
    DB_USER=root \
    DB_PASS=sVcFQqEAWxrqEnPnRKETakUENczPUliF \
    DB_NAME=railway

# Make port 5000 available to the outside world
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
