# GitPod K8S

GitPod customize environment for deployment apps or managing cloud hosted k8s environments

Self-referential (use gitpod-k8s to develop against itself!)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/from-referrer/)

## Cloud Providers Supported

- Civo
  - Go to <https://www.civo.com/account/security> and generate an API Key
  - Within Gitpod, run

    ```sh
    gp env CIVO_API_KEY=xxxxxyyyzzz
    ```

## Container Registries Supported

- Docker
  - base64 encode your password:

    ```sh
    echo -n 'my_good_password' | base64
    ```

  - Within Gitpod, run the following

    ```sh
    gp env DOCKER
    ```
- Quay-io

  - In upper-right hand corner, click your username, then Account Settings
  - Click "Generate Encrypted Password"
  - Select "Docker Login"  Use the data from "-u" for the username and "-p" for the password
  - Within Gitpod, run

    ```sh
    gp env QUAY_USERNAME=usernmae
    gp env QUAY_PASSWORD=myquaypassword
    ```