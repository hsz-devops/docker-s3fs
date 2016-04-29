#!/bin/sh

# export S3User=longgeneratedid
# export S3Secret=longnastygernatedsecret

if [[ $# -lt 2 ]]
then
  echo
  echo "set S3User and S3Secret env then.."
  echo
  echo "Usage: $0 bucket mountpoint"
  echo
  echo "Example: $0 snuffy /mnt/snuffy"
  echo
  echo "Docker 1.10 or later required"
  exit -1
fi

if [ -z "${S3User}" -o -z "${S3Secret}" ]; then
  echo "set S3User and S3Secret env vars"
  exit -2
fi

IMAGE_NAME="mount-s3fs"

docker run \
    --privileged \
    -e S3User=${S3User} -e S3Secret=${S3Secre}t \
    -v $2:/mnt/mountpoint:shared \
    --cap-add SYS_ADMIN \
    ${IMAGE_NAME} \
        $1 \
        /mnt/mountpoint \
        -o passwd_file=/etc/passwd-s3fs \
        -d -d -f -o f2 -o curldbg
