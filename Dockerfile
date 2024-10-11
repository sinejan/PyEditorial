FROM python:3.8-slim

WORKDIR /app

# Gereksinim dosyalarını kopyala
COPY requirements.txt ./




# Bağımlılıkları yükle
RUN pip install --upgrade pip setuptools && \
    pip install --no-cache-dir -r requirements.txt

# entrypoint.sh dosyasını kopyala
COPY entrypoint.sh ./

# Uygulama dosyalarını kopyala
COPY . .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "PyEditorial.wsgi:application"]