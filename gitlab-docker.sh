# run gitlab in docker container before Docker Compose can support user namespace

docker stop gitlab
docker pull gitlab/gitlab-ce

docker run --detach \
--hostname gitlab \
-p 80:80 -p 443:443 -p 722:22 -p 5005:5005 \
--name gitlab \
--restart always \
-v /mnt/data/gitlab/config:/etc/gitlab \
-v /mnt/data/gitlab/logs:/var/log/gitlab \
-v /mnt/data/gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce

sleep 15
#docker exec gitlab chown root:root /run/sshd
docker exec gitlab service postfix start

