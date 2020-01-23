FROM saorikido/docker-alpine_3.11.3-glibc:latest

LABEL maintainer="neesonqk@gmail.com"

# Add Java 8u202 as dependency

# Copy JDK file
COPY jdk-8u202-linux-x64.tar.gz /opt/jdk-8u202-linux-x64.tar.gz

# Add Java 8u202 as dependency
ENV JAVA_HOME="/usr/lib/jvm/default-jvm"

# Copy JDK file
COPY jdk-8u202-linux-x64.tar.gz /opt/jdk-8u202-linux-x64.tar.gz

RUN mkdir -p /usr/lib/jvm && \
    tar -xvzf /opt/jdk-8u202-linux-x64.tar.gz -C /usr/lib/jvm/ && \
    ln -s "/usr/lib/jvm/jdk1.8.0_202" "${JAVA_HOME}" && \
    ln -s "$JAVA_HOME/bin/"* "/usr/bin/"

RUN rm /opt/jdk-8u202-linux-x64.tar.gz

CMD ["sh", "-c", "java -version" ]