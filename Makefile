test:
	podman run -ti  --rm \
  --hostname gitlab.valleybee.home \
  --publish 443:443 --publish 8929:80 --publish 2224:22 \
  --name gitlab \
  --volume ${PWD}/config:/etc/gitlab:Z \
  --volume ${PWD}/logs:/var/log/gitlab:Z \
  --volume ${PWD}/data:/var/opt/gitlab:Z \
  --shm-size 256m \
  gitlab/gitlab-ce:arm64 /bin/bash
run:
	podman run -ti --rm -v /logs:/var/log/:Z  -p 8929:80 --name gitlab gitlab/gitlab-ce:arm64 
