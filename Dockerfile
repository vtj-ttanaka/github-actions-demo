FROM python:3.12-slim AS build
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt -t .
COPY . .

FROM python:3.12-slim
WORKDIR /app
COPY --from=build /app /app
RUN useradd -m appuser
USER appuser
CMD ["python", "app.py"]
