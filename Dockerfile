# Dockerfile
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application code into the container
COPY app.py .

# Install any necessary dependencies
RUN pip install flask

# Expose the port the application will run on
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
