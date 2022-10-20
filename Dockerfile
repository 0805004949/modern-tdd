###### base
FROM python:3.10.8-alpine as base
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
WORKDIR /app

##### build
FROM base as build 
RUN pip install poetry==1.1.13 && poetry config virtualenvs.in-project true 
COPY pyproject.toml poetry.lock /app/ 
RUN poetry install --no-dev --no-interaction --no-root
WORKDIR $PYSETUP_PATH
COPY $POETRY_HOME $POETRY_HOME
COPY $PYSETUP_PATH $PYSETUP_PATH
