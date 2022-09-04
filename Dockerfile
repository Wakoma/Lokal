# This dockerfile builds a Lokal installation *CLIENT* that you can
# use to bootstrap a Lokal server
#
# Usage:
# docker build -n lokal-client:latest -f Dockerfile .
# docker run --rm -v `pdw`:/lokal lokal-client:latest
# $ # now you can issue commands from the documentation
FROM python:3.9-slim-bullseye as controller
RUN pip install ansible
COPY ./requirements.yml .
RUN ansible-galaxy install -r requirements.yml
VOLUME /lokal
ENTRYPOINT ["bash"]
