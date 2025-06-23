FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
 
RUN pip install --no-cache-dir -r requirements.txt
 
COPY . .

EXPOSE 5001

# Set environment variables for Flask
ENV FLASK_APP=main.py
ENV FLASK_ENV=development

# Command to run the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]
