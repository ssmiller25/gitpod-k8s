# GitPod K8S

GitPod customize environment for deployment apps or managing cloud hosted k8s environments

Self-referential (use gitpod-k8s to develop against itself!)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/from-referrer/)

## Initial Setup

- Create a `.gitpod.yml` in your repository with the following contents:

  ```sh
  image: quay.io/ssmiller25/gitpod-k8s:latest
  tasks:
    - name: Login to Cloud Resources
      command: |
        bash $HOME/scripts/00-cloudinit.sh
  vscode:
    extensions:
      - ms-azuretools.vscode-docker
      - ms-kubernetes-tools.vscode-kubernetes-tools
  ```

- *Optional* Put a link in your README.md to make it easy to open up in Gitpod!  

  ```markdown
  [![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/from-referrer/)
  ```

  - *Note* The `/from-referrer/` only works for public repos.  For private repos, use [a full link](https://www.gitpod.io/docs/context-urls)

## Cloud Providers Supported

- Civo
  - Go to <https://www.civo.com/account/security> and generate an API Key
  - Within Gitpod, run

    ```sh
    gp env CIVO_API_KEY=xxxxxyyyzzz
    gp env CIVO_REGION=NYC1    #civo region ls to see all available regions
    ```

## Container Registries Supported

- Docker
  - Within Gitpod, run the following

    ```sh
    gp env DOCKER_USERNAME=username
    gp env DOCKER_PASSWORD=$(echo -n 'my_good_password' | base64)
    ```

- Quay
  - In upper-right hand corner, click your username, then Account Settings
  - Click "Generate Encrypted Password"
  - Select "Docker Login"  Use the data from "-u" for the username and "-p" for the password
  - Within Gitpod, run

    ```sh
    gp env QUAY_USERNAME=usernmae
    gp env QUAY_PASSWORD=myquaypassword
    ```
    

## Update notes

1 Pull latest sha256 hash:

  ```sh
  # Uses act to run github actions
  ./lrun -j docker-latest
  ```

2. Update SHA256 hash locally
3. Build docker container locally and test

  ```sh
  docker build -t local-test .
  
  ```