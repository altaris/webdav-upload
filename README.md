webdav-upload
=============

[![Docker Pulls](https://img.shields.io/docker/pulls/altaris/webdav-upload.svg)](https://hub.docker.com/r/altaris/webdav-upload/)
[![GitHub](https://img.shields.io/github/license/altaris/webdav-upload.svg)](https://choosealicense.com/licenses/mit/)

A simple docker image to upload a file over WebDAV.

The upload script reads the following environment variables:

* `FILE`: File to upload.
* `PASSWORD`: Password used to authenticate.
* `SERVER`: URL to the WebDAV server.
* `USER`: User used to authenticate.
* `VERBOSE` (default: `no`): A non `yes` value is considered `no`. **God knows
  what information might get exposed, be careful with this!**
* `WEBDAV_PATH` (default: empty path): Path where the file should be uploaded.
* `WEBDAV_PREFIX` (default: `remote.php/dav/files`): See after.
* `WEBDAV_USER` (default: `USER`): User who owns the directory where the file should be uploaded.

The URL where the `FILE` will be uploaded is thus

```
$SERVER/$WEBDAV_PREFIX/$WEBDAV_USER/$WEBDAV_PATH
```

# Example

## As a drone plugin

Assuming your drone repository has secrets `user`, `password`, and `server`:

```yaml
upload:
  file: build/project.tar.gz
  image: altaris/webdav-upload
  secrets:
    - source: user
      target: USER
    - source: password
      target: PASSWORD
    - source: server
      target: SERVER
  webdav_path: my/dope/project/project.tar.gz
```

or equivalently, if the server address isn't a secret:

```yaml
upload:
  file: build/project.tar.gz
  image: altaris/webdav-upload
  secrets:
    - source: user
      target: USER
    - source: password
      target: PASSWORD
  server: cloud.mcnope.com
  webdav_path: my/dope/project/
```
