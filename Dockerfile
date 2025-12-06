
# Use Python 3.9 (stable)
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install system dependencies (Poppler is required for pdf2image)
RUN apt-get update && apt-get install -y \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
# (We don't need the windows-specific protobuf fix here, standard is fine, but <5 constraint helps safety)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 7860 (Standard for Hugging Face Spaces)
EXPOSE 7860

# Command to run the app
# Note: HF expects the app to run on port 7860
CMD ["streamlit", "run", "app.py", "--server.port=7860", "--server.address=0.0.0.0"]
