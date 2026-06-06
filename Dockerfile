FROM python:3.7-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    && rm -rf /var/lib/apt/lists/*

# Set up a new user 'user' with UID 1000 to match Hugging Face standard
RUN useradd -m -u 1000 user

WORKDIR /app

# Upgrade pip, setuptools, and wheel for package compatibility
RUN pip install --no-cache-dir --upgrade pip==22.0.4 setuptools==57.5.0 wheel

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy nltkdownload.py and run it to pre-download NLTK data during build
COPY nltkdownload.py .
RUN python nltkdownload.py

# Copy the rest of the application files
COPY . .

# Ensure correct permissions for writing db.sqlite3 and model files at runtime
RUN mkdir -p model && chmod -R 777 /app

# Switch to the non-root user
USER user

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PORT=7860

# Expose port 7860 (Hugging Face Spaces requirement)
EXPOSE 7860

# Run Django migrations and start the server
CMD python manage.py migrate && python manage.py runserver 0.0.0.0:7860
