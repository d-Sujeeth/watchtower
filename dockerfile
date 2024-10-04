FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy your application code
COPY . .

# Install necessary packages
RUN pip install --no-cache-dir Flask Requests

# Define the command to run your application
CMD ["python", "app.py"]  # Replace with your actual main script name
