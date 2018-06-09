#docker build -t bind_dns -f ./Dockerfile .

FROM centos:7
EXPOSE 53 53/udp

COPY docker_build_files /tmp/docker_build_files

RUN cp /tmp/docker_build_files/docker_entrypoint.sh /docker_entrypoint.sh \
   && chmod 775 /docker_entrypoint.sh \
   && yum -y install bind bind-utils \
   && rm -rf /tmp/docker_build_files

ENTRYPOINT ["/docker_entrypoint.sh"]