# Use the official Python image as a base
FROM python:3.8-slim-buster

# Update package list and install awscli
RUN apt update -y && apt install awscli -y

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project into the working directory
COPY . /app

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the application
CMD ["python3", "app.py"]
