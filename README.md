# bind_dns-docker-image

This is a simple bind docker image

### Usage

Run the following command to start the container (replace /mnt/named/named.conf with your chosen path):
```sh
docker run -p 53:53 -p 53:53/udp -d -v /mnt/named/named.conf:/usr/local/named/named.conf --name bind_dns maxchen021/bind_dns
```

To reload your named config, run the following command:
```
docker exec -it bind_dns /docker_entrypoint.sh reload
```