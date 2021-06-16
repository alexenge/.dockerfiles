# .docker_images

![GitHub](https://img.shields.io/github/license/alexenge/docker_images)

Docker images that serve as the basis for my project-specific containers
## R-based images

| Image | Packages | Status | Size | Demo |
|-|-|-|-|-|
| [`r_basics`](https://github.com/alexenge/docker_images/tree/r_basics) | R, RStudio, Python (via Jupyter Notebook or R-reticulate) and common R packages for mixed-effects modeling | ![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/alexenge/docker_images/autobuild/r_basics) | ![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/alexenge/r_basics) | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/alexenge/docker_images/r_basics?urlpath=rstudio) |
| [`r_papaja`](https://github.com/alexenge/docker_images/tree/r_papaja) | Everything in `r_basics` + R-papaja and LaTeX packages for preparing APA-style manuscripts with R Markdown | ![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/alexenge/docker_images/autobuild/r_papaja) | ![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/alexenge/r_papaja) | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/alexenge/docker_images/r_papaja?urlpath=rstudio) |
| [`r_stan`](https://github.com/alexenge/docker_images/tree/r_stan) | Everything in `r_papaja` + the Stan language for probabilistic programming and related R packages | ![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/alexenge/docker_images/autobuild/r_stan) | ![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/alexenge/r_stan) | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/alexenge/docker_images/r_stan?urlpath=rstudio) |

## Usage

After installing [Docker Desktop](https://www.docker.com/products/docker-desktop), the images can be pulled and run from [Docker Hub](https://hub.docker.com/u/alexenge):

```bash
docker run --rm -p 8888:8888 alexenge/r_basics:latest
```

Or from the [GitHub container registry](https://github.com/alexenge?ecosystem=container&tab=packages):

```bash
docker run --rm -p 8888:8888 ghcr.io/alexenge/r_basics:latest
```
