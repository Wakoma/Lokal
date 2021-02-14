FROM python:3.9.1-alpine3.12 as base

FROM base as builder
ENV PATH="/install/bin:${PATH}"
ENV PYTHONPATH=/install
RUN mkdir /install
RUN apk update && apk add gcc libffi-dev musl-dev openssl-dev
RUN pip install --target=/install ansible
RUN wget https://releases.hashicorp.com/packer/1.6.6/packer_1.6.6_linux_amd64.zip -O temp.zip && \
    unzip temp.zip && \
    chmod +x packer && \
    mv packer /install/bin && \
    rm temp.zip
COPY requirements.yml /requirements.yml
RUN ansible-galaxy install -r /requirements.yml -p /etc/ansible/roles
  
FROM base as controller
RUN apk --no-cache add openssh
ENV PYTHONPATH=/usr/local
COPY --from=builder /install /usr/local
COPY --from=builder /etc/ansible/roles /etc/ansible/roles
