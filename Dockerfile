FROM python:3.9.0

WORKDIR /home/

RUN echo 'ee'

RUN git clone https://github.com/100100001001/drf_2.git

WORKDIR /home/drf_2/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=drf_2.settings.deploy && python manage.py migrate --settings=drf_2.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=drf_2.settings.deploy drf_2.wsgi --bind 0.0.0.0:8000"]
