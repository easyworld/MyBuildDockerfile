# 使用 devkitpro/devkita64:latest 作为基础镜像
FROM devkitpro/devkita64:latest

# 更新 apt-get 并安装 build-essential、jq、unzip 和 zip
RUN apt-get update && \
    apt-get install -y build-essential jq unzip zip
