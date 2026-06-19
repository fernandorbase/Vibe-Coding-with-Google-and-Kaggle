# Use the official lightweight Python image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
# (Make sure you have a requirements.txt file in your repo)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 8080 (Cloud Run's default port)
EXPOSE 8080

# Command to run your application with Gunicorn
# This points to processor/main.py and imports your WSGI app (usually named 'app')
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "1", "--threads", "8", "--timeout", "0", "processor.main:app"]
