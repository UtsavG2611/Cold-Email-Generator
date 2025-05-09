FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    sqlite3 \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN sqlite3 --version

WORKDIR /app
COPY . .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8501
CMD ["streamlit", "run", "main.py"]
