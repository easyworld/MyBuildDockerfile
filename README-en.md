# MyBuildDockerfile

Store Dockerfiles for building Nintendo Switch-related projects.

## Project Overview

This project aims to store and manage Dockerfiles required for building Nintendo Switch-related projects. These Dockerfiles provide a complete build environment, making them especially suitable for use in CI/CD environments like GitHub Actions.

When building Nintendo Switch-related projects (such as Atmosphere and Hekate), the [devkitPro](https://devkitpro.org/) aarch64 build environment is required. However, downloading this environment from the official source presents the following issues:

1. **Daily Download Limitations**: The official source imposes limits on the number of downloads per day, which may lead to failures, especially in high-frequency automated build scenarios.
2. **Time-Consuming Downloads**: Downloading and configuring the environment from the official source each time can be time-consuming.

To address these issues, this project pre-builds a complete development environment that can be used directly via Docker images. This eliminates the need to download the environment each time and bypasses the daily download limits.

## File Description

### Dockerfile List

- **`atmosphere-build-env`**:  
  A Docker environment for building the [Atmosphere](https://github.com/Atmosphere-NX/Atmosphere) project.

- **`hekate-build-env`**:  
  A Docker environment for building the [Hekate](https://github.com/CTCaer/hekate) project.

## Usage

You can either build the images yourself or directly use the images I have uploaded to Docker Hub:

### Download from Docker Hub

```bash
# Download the atmosphere-build-env image
docker pull easyworld/atmosphere-build-env
# Download the hekate-build-env image
docker pull easyworld/hekate-build-env
```

Once the images are downloaded, you can use them directly. **There is no need** to *clone the project* or *build the images*.

### Clone the Project

First, clone the project to your local environment:

```bash
git clone https://github.com/easyworld/MyBuildDockerfile.git
cd MyBuildDockerfile
```

### Build the Images

Select the Dockerfile you need and use the following command to build the Docker image:

```bash
docker build -f <Dockerfile Path> -t <Image Name> .
```

For example:

```bash
# Build the Atmosphere environment
docker build -f ./atmosphere-build-env -t atmosphere-env .

# Build the Hekate environment
docker build -f ./hekate-build-env -t hekate-env .
```

### Run the Containers

#### Atmosphere

Run the Atmosphere container with the following command, mounting your project source directory:

```bash
docker run --rm -it -v /your/host/atmosphere/source/path:/ams atmosphere-env /bin/bash
```

After running the container, navigate to the `ams` directory and execute `make` to build the project:

```bash
cd ams
make
```

#### Hekate

Run the Hekate container with the following command, mounting your project source directory:

```bash
docker run --rm -it -v /your/host/hekate/source/path:/hekate hekate-env /bin/bash
```

After running the container, navigate to the `hekate` directory and execute `make` to build the project:

```bash
cd hekate
make
```

## Contribution

Contributions to this project are welcome! If you have new Dockerfiles or improvement suggestions, please submit a Pull Request or create an Issue.

### Submit a Pull Request

1. Fork this repository.
2. Create a branch (`git checkout -b feature/my-feature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/my-feature`).
5. Create a Pull Request.

## License

This project is licensed under the [MIT License](LICENSE). You are free to use and modify this project but must retain the original license information.

## Contact

If you encounter any issues or have suggestions, please reach out via the Issues page.
