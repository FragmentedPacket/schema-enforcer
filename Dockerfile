ARG PYTHON_VER

FROM python:${PYTHON_VER}-slim

RUN pip install --upgrade pip \
  && pip install poetry

WORKDIR /local
COPY pyproject.toml /local

RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi -E ansible
