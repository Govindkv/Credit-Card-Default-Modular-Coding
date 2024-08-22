# Use the official Python image as a base
FROM python:3.8-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Expose the port that the Flask app runs on
EXPOSE 8080

# Run the application
CMD ["python", "app.py"]
