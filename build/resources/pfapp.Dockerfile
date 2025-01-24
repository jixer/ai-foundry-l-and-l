FROM pf:azureml

# install the requirements
COPY ./flow/requirements.txt /flow/requirements.txt
RUN pip install -r flow/requirements.txt && pip cache purge

COPY ./flow /flow


EXPOSE 8080

COPY ./connections /connections

# reset runsvdir
RUN rm -rf /var/runit
COPY ./runit /var/runit
# grant permission
RUN chmod -R +x /var/runit

COPY ./start.sh /
CMD ["bash", "./start.sh"]
