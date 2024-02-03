FROM python:3.10-alpine

WORKDIR /usr/src/api
COPY . .

RUN apk --no-cache add curl \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

CMD ["uvicorn", "api:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]
