FROM python:3.10-alpine

WORKDIR /usr/src/authorization
COPY . .
RUN apk --no-cache add curl
RUN pip install --upgrade pip requests python-dotenv boto3

ENTRYPOINT ["python"]
CMD ["./authorization.py"]