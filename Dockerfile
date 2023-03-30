FROM python:3.8-slim-buster

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python3", "happy_birthday_sms.py" ]
