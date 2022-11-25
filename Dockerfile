# This dockerfile builds a Lokal *CLIENT* that you can use to bootstrap a Lokal server.
# It is useful mainly on windows because ansible does not work there (but you have WSL2 now)
#
# Usage:
# docker build -t lokal-client:latest .
# docker run --rm -itv ${pwd}:/lokal lokal-client:latest
# $ # now you can issue commands from the documentation
FROM python:3.9-bullseye as controller
RUN pip install ansible
COPY ./requirements.yml .
RUN ansible-galaxy install -r requirements.yml
VOLUME /lokal
WORKDIR /lokal
ENTRYPOINT ["bash"]
