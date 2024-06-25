FROM python:3.9-alpine3.13
LABEL maintainer='anuj.com'

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN pip install flake8
RUN python3 -m venv /py && \
    /py/bin/pip install --upgrade pip --no-cache-dir && \
    /py/bin/pip install -r /tmp/requirements.txt --no-cache-dir && \
    # if [ $DEV = "true" ]; \
    #     then /py/bin/pip install -r /tmp/requirements.dev.txt --no-cache; \
    #     # then hello; \
    # fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/py/bin:$PATH"

USER django-user
