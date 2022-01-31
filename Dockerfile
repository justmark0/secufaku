FROM python:3.10

WORKDIR /app
ENV PYTHONUNBUFFERED 1
RUN pip install --upgrade pip poetry && poetry config virtualenvs.create false

COPY pyproject.toml .
COPY poetry.lock .
RUN poetry install --no-dev
COPY . .

RUN apt update && \
    apt install -yq --no-install-recommends binutils libproj-dev gdal-bin \
    postgresql-client libsasl2-dev libldap2-dev libssl-dev gettext && \
    python src/manage.py collectstatic --noinput

CMD python src/manage.py migrate && python src/manage.py runserver 0.0.0.0:8000
