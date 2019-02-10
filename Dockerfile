FROM gcr.io/cloud-builders/kubectl
ARG VERSION=2.0.1

RUN curl -Lo kustomize https://github.com/kubernetes-sigs/kustomize/releases/download/v{$VERSION}/kustomize_${VERSION}_linux_amd64 && chmod +x kustomize && mv kustomize /usr/local/bin
COPY kustomize.sh /kustomize.sh
ENTRYPOINT ["/bin/bash", "/kustomize.sh"]
