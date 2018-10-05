# run gitlab in docker container before Docker Compose can support user namespace

#docker rm --force gitlab
#docker pull gitlab/gitlab-ce

docker run --detach \
--hostname gitlab \
-p 80:80 -p 443:443 -p 722:22 -p 5005:5005 \
--name gitlab \
--restart always \
-v /home/gitlab/config:/etc/gitlab \
-v /home/gitlab/logs:/var/log/gitlab \
-v /home/gitlab/data:/var/opt/gitlab \
polinux/gitlab-ce:10.0.4-ce.0

#sleep 15
#docker exec gitlab chown root:root /run/sshd
#docker exec -it gitlab bash -c "apt update && apt install -y postfix && service postfix start"
