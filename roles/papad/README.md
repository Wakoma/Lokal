# Papad

Is a note taking application that uses internal S3 for storing its data.

## Dev notes

All containers need to be run privileged. Only the nginx container drops
privileges when necessary.

For some reason, initial call to papad redirects to port 9001 that is bound
to minio - the local S3 provider. Therefor this port needs to be bound to the
host machine and allowed in the firewall.