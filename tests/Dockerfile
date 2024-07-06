FROM python:3

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    firefox-esr \
    xvfb \
    && apt-get clean

RUN pip3 install robotframework robotframework-seleniumlibrary  --break-system-packages

WORKDIR /tests

COPY . /tests/

CMD [ "python3", "main.py"]

