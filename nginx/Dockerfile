FROM nginx:latest
COPY ./default.conf /etc/nginx/conf.d
COPY ./ssl/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
COPY ./ssl/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt

RUN chmod 644 /etc/ssl/private/nginx-selfsigned.key
RUN chmod 600 /etc/ssl/certs/nginx-selfsigned.crt

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "PyEditorial.wsgi:application"]

EXPOSE 80
EXPOSE 443
