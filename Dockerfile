FROM python:3.9-slim-bullseye as controller
RUN pip install ansible
COPY ./requirements.yml .
RUN ansible-galaxy install -r requirements.yml
VOLUME /lokal
ENTRYPOINT ["bash"]
