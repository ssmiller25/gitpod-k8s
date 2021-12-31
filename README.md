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