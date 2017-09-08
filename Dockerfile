FROM rhel-atomic:latest

ARG JAVA_VERSION=1.8.0

LABEL name="java-oracle" \
    version="8" \
    io.openshift.tags="base,java,runtime,oracle" \
    io.k8s.description="Oracle Java base image providing java runtime" \
    io.k8s.display-name="Oracle Java 8"

ENV JAVA_HOME="/usr/lib/jvm/jre" \
    JAVA_VERSION="${JAVA_VERSION}"

RUN microdnf install \
        --enablerepo=rhel-7-server-rpms \
        --enablerepo=rhel-7-server-thirdparty-oracle-java-rpms \
        --nodocs \
        java-${JAVA_VERSION}-oracle \
    && microdnf clean all \
    && cp /etc/pki/ca-trust/source/anchors/* ${JAVA_HOME}/jre/lib/security/.