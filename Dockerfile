# 使用一个轻量级的Linux基础镜像，并确保已安装bash和docker-cli
FROM alpine:3.18

# 使用国内镜像源加速下载
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# 安装bash和docker-cli (Docker命令行工具)
RUN apk add --no-cache bash docker

# 将当前目录下的所有文件复制到镜像中的 /app 目录
COPY . /app

# 设置工作目录为 /app
WORKDIR /app

# 设置入口脚本（确保你的脚本有执行权限）
ENTRYPOINT ["/app/docker_image_pusher.sh"]
