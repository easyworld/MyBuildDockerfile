# 使用 devkitpro/devkita64:latest 作为基础镜像
FROM devkitpro/devkita64:latest

# 更新 apt-get 并安装 curl
RUN apt-get update && apt-get install -y curl python3-pip

# 更新 dkp-pacman 并安装指定的包
RUN dkp-pacman -Syu --noconfirm switch-glm switch-libjpeg-turbo hactool --needed

# 使用 pip 安装 lz4 和 pycryptodome
RUN pip install --no-cache-dir --break-system-packages lz4 pycryptodome
