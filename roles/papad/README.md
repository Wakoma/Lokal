# Papad

Is a note taking application that uses internal S3 for storing its data.

## Configuration

Preset admin password for internal S3

```yaml
minio_user_papad: admin
minio_password_papad: somePassword
```

## TODO

Test authentication - /auth/login should be handled by the API and /auth/ by UI.