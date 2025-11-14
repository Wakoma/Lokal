# Custom

Custom is a service that will checkout any app using git (preferably using a TAG)
and install it using the app's Dockerfile.

Please make sure to have enough RAM and disk available on the target machine
because the docker image will be created directly on it.


## Configuration

- `custom_name` - one-word name for your app (will be used as docker service name)
- `custom_docker` - docker image path (exclusive with custom_git)
- `custom_git` - url to checkout
- `custom_ref` - branch/tag to checkout
- `custom_port` - that should be bound to the gateway
- `custom_env` - a dictionary/map of environment variables passed to the container
- `custom_dirs` - a dictionary of directories "local: remote" - for backup purposes
