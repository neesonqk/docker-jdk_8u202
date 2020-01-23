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
    ln -s "$JAVA_HOME/bin/"* "/usr/bin/" && \
    rm /opt/jdk-8u202-linux-x64.tar.gz && \
    rm -rf "$JAVA_HOME/"*src.zip && \
    rm -rf "$JAVA_HOME/lib/missioncontrol" \
           "$JAVA_HOME/lib/visualvm" \
           "$JAVA_HOME/lib/"*javafx* \
           "$JAVA_HOME/jre/lib/plugin.jar" \
           "$JAVA_HOME/jre/lib/ext/jfxrt.jar" \
           "$JAVA_HOME/jre/bin/javaws" \
           "$JAVA_HOME/jre/lib/javaws.jar" \
           "$JAVA_HOME/jre/lib/desktop" \
           "$JAVA_HOME/jre/plugin" \
           "$JAVA_HOME/jre/lib/"deploy* \
           "$JAVA_HOME/jre/lib/"*javafx* \
           "$JAVA_HOME/jre/lib/"*jfx* \
           "$JAVA_HOME/jre/lib/amd64/libdecora_sse.so" \
           "$JAVA_HOME/jre/lib/amd64/"libprism_*.so \
           "$JAVA_HOME/jre/lib/amd64/libfxplugins.so" \
           "$JAVA_HOME/jre/lib/amd64/libglass.so" \
           "$JAVA_HOME/jre/lib/amd64/libgstreamer-lite.so" \
           "$JAVA_HOME/jre/lib/amd64/"libjavafx*.so \
           "$JAVA_HOME/jre/lib/amd64/"libjfx*.so && \
    rm -rf "$JAVA_HOME/jre/bin/jjs" \
           "$JAVA_HOME/jre/bin/keytool" \
           "$JAVA_HOME/jre/bin/orbd" \
           "$JAVA_HOME/jre/bin/pack200" \
           "$JAVA_HOME/jre/bin/policytool" \
           "$JAVA_HOME/jre/bin/rmid" \
           "$JAVA_HOME/jre/bin/rmiregistry" \
           "$JAVA_HOME/jre/bin/servertool" \
           "$JAVA_HOME/jre/bin/tnameserv" \
           "$JAVA_HOME/jre/bin/unpack200" \
           "$JAVA_HOME/jre/lib/ext/nashorn.jar" \
           "$JAVA_HOME/jre/lib/jfr.jar" \
           "$JAVA_HOME/jre/lib/jfr" \
           "$JAVA_HOME/jre/lib/oblique-fonts" && \
    apk add --no-cache --virtual=build-dependencies wget ca-certificates unzip &&\
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" && \
    unzip -jo -d "${JAVA_HOME}/jre/lib/security" "jce_policy-8.zip" && \
    rm "${JAVA_HOME}/jre/lib/security/README.txt" && \
    \
    apk del wget && \
    apk del unzip && \
    apk del ca-certificates && \
    apk del build-dependencies

CMD ["sh", "-c", "java -version" ]