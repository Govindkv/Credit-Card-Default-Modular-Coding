# Use the official Python image as a base
FROM python:3.8-slim-buster

# Set environment variables
RUN apt update -y && apt install -y awscli

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Run the application
CMD ["python", "app.py"]
