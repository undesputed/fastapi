FROM python:3.8-slim

COPY . /app

WORKDIR /app

RUN pip install -U pip

RUN pip install -r requirements.txt && pip install psycopg2-binary

RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]