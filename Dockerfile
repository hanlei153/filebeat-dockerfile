FROM alpine
MAINTAINER HANLEI
WORKDIR /opt
ADD filebeat-7.9.3-linux-x86_64.tar.gz /opt
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache libc6-compat #运行filebeat命令时sh会提示not found，安装libc6-compat解决该问题
CMD ["sh", "-c", "/opt/filebeat-7.9.3-linux-x86_64/filebeat -e -c /opt/filebeat-7.9.3-linux-x86_64/filebeat.yml"]
