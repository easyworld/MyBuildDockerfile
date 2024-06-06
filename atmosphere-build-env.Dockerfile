# 使用 devkitpro/devkita64:latest 作为基础镜像
FROM devkitpro/devkita64:latest

# 更新 apt-get 并安装 curl
RUN apt-get update && apt-get install -y curl

# 下载 get-pip.py 并使用 Python 2 运行安装 pip，然后删除 get-pip.py
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && \
    python2 get-pip.py && \
    rm get-pip.py

# 更新 dkp-pacman 并安装指定的包
RUN dkp-pacman -Syu --noconfirm switch-glm switch-libjpeg-turbo hactool --needed

# 使用 pip 安装 lz4 和 pycryptodome
RUN pip install lz4 pycryptodome
