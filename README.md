# MyBuildDockerfile

存储用于构建Switch相关项目的Dockerfiles。

## 项目简介

本项目旨在存储和管理与 Nintendo Switch 相关的项目构建所需的 Dockerfiles。这些 Dockerfiles 提供了完整的编译环境，特别适合在 GitHub Actions 等 CI/CD 环境中使用。

在构建与 Nintendo Switch 相关的项目（如 Atmosphere 和 Hekate）时，需要使用 [devkitPro](https://devkitpro.org/) 提供的 aarch64 编译环境。然而，通过官方源下载这些环境存在以下问题：

1. **每日下载限制**：官方源对环境的下载次数有限制，尤其是在高频率的自动化构建场景中可能导致失败。
2. **下载耗时**：每次从官方源下载并配置环境需要耗费较多时间。

为了解决这些问题，本项目预先制作了完整的编译环境，直接通过 Docker 镜像即可使用，省去了每次下载环境的时间，并且突破了每日下载次数的限制。

## 文件说明

### Dockerfiles 列表

- **`atmosphere-build-env`**:  
  用于构建 [Atmosphere](https://github.com/Atmosphere-NX/Atmosphere) 项目的 Docker 环境。
  
- **`hekate-build-env`**:  
  用于构建 [Hekate](https://github.com/CTCaer/hekate) 项目的 Docker 环境。

## 使用方法

你可以自己构建镜像或者直接使用我在dockerhub上的镜像：

### 从dockerhub下载
```bash
# 下载atmosphere-build-env镜像
docker pull easyworld/atmosphere-build-env
# 下载hekate-build-env镜像
docker pull easyworld/hekate-build-env
```
镜像下载完成后即可直接使用，**不再需要***克隆项目*与*构建镜像*

### 克隆项目

首先克隆项目到本地：

```bash
git clone https://github.com/easyworld/MyBuildDockerfile.git
cd MyBuildDockerfile
```

### 构建镜像

选择您需要的 Dockerfile 并使用以下命令构建 Docker 镜像：

```bash
docker build -f <Dockerfile路径> -t <镜像名称> .
```

例如：

```bash
# 构建 Atmosphere 环境
docker build -f ./atmosphere-build-env -t atmosphere-env .

# 构建 Hekate 环境
docker build -f ./hekate-build-env -t hekate-env .
```

### 运行容器

#### Atmosphere

使用以下命令运行 Atmosphere 的容器，并挂载您的项目源码目录：

```bash
docker run --rm -it -v /your/host/atmosphere/source/path:/ams atmosphere-env /bin/bash
```

运行容器后，进入 `ams` 目录并执行 `make` 进行项目编译：

```bash
cd ams
make
```

#### Hekate

使用以下命令运行 Hekate 的容器，并挂载您的项目源码目录：

```bash
docker run --rm -it -v /your/host/hekate/source/path:/hekate hekate-env /bin/bash
```

运行容器后，进入 `hekate` 目录并执行 `make` 进行项目编译：

```bash
cd hekate
make
```

## 贡献

欢迎您对本项目的贡献！如果您有新的 Dockerfile 或改进建议，请提交 Pull Request 或创建 Issue。

### 提交 Pull Request

1. Fork 本仓库
2. 创建一个分支 (`git checkout -b feature/my-feature`)
3. 提交更改 (`git commit -am 'Add some feature'`)
4. 推送到分支 (`git push origin feature/my-feature`)
5. 创建一个 Pull Request

## 许可证

本项目遵循 [MIT License](LICENSE)。您可以自由使用和修改本项目，但请保留原始许可证信息。

## 联系方式

如果您在使用中遇到问题或有任何建议，请通过 Issues 页面与我们联系。
