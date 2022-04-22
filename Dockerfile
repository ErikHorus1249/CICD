# python evironment
FROM python:3.8

RUN pip install poetry

# working directory
WORKDIR /code

# copy file reuirement from host to docker
# COPY ./requirements.txt /code/requirements.txt

# install reuquirements
# RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# volume app dir
COPY ./app /code/app

RUN poetry install

ENTRYPOINT ["poetry","run"]

# run uvicorn server 
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]