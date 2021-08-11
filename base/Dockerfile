FROM alpine:3.10

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV SPARK_VERSION=2.4.5
ENV HADOOP_VERSION=2.8

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /
COPY spark-ext/druid-spark-0.22.0-SNAPSHOT.jar /
COPY hadoop-config/hdfs-site.xml /
COPY hadoop-config/jets3t.properties /

#COPY bde-spark.css /css/org/apache/spark/ui/static/timeline-view.css

RUN apk add --no-cache curl bash openjdk8-jre python3 py-pip nss libc6-compat \
      && ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2 \
      && chmod +x *.sh \
      && wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop-scala-2.12.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-without-hadoop-scala-2.12.tgz \
      && mv spark-${SPARK_VERSION}-bin-without-hadoop-scala-2.12 spark \
      && rm spark-${SPARK_VERSION}-bin-without-hadoop-scala-2.12.tgz \
      && wget https://archive.apache.org/dist/hadoop/common/hadoop-2.8.0/hadoop-2.8.0.tar.gz \
      && tar -xvzf hadoop-2.8.0.tar.gz \
      && mv hadoop-2.8.0 hadoop \
      && export SPARK_DIST_CLASSPATH=$(/hadoop/bin/hadoop classpath) \
      && rm hadoop-2.8.0.tar.gz \
      && mv spark/jars/jackson-* / \
      && wget https://repo1.maven.org/maven2/com/fasterxml/jackson/module/jackson-module-scala_2.12/2.8.4/jackson-module-scala_2.12-2.8.4.jar \
      && mv jackson-module-scala_2.12-2.8.4.jar spark/jars \
      && wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.8.4/jackson-databind-2.8.4.jar \
      && mv jackson-databind-2.8.4.jar spark/jars \
      && wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.8.4/jackson-annotations-2.8.4.jar \
      && mv jackson-annotations-2.8.4.jar spark/jars \
      && wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.8.4/jackson-core-2.8.4.jar \
      && mv jackson-core-2.8.4.jar spark/jars \
      && wget https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.8.4/jackson-dataformat-yaml-2.8.4.jar \
      && mv jackson-dataformat-yaml-2.8.4.jar spark/jars \
      && wget https://repo1.maven.org/maven2/com/fasterxml/jackson/module/jackson-module-jaxb-annotations/2.8.4/jackson-module-jaxb-annotations-2.8.4.jar \
      && mv jackson-module-jaxb-annotations-2.8.4.jar spark/jars \
      && wget https://repo1.maven.org/maven2/com/fasterxml/jackson/module/jackson-module-paranamer/2.8.4/jackson-module-paranamer-2.8.4.jar \
      && mv jackson-module-paranamer-2.8.4.jar spark/jars \
      && wget https://muug.ca/mirror/apache-dist//commons/dbcp/binaries/commons-dbcp2-2.9.0-bin.tar.gz \
      && tar -xvzf commons-dbcp2-2.9.0-bin.tar.gz \
      && mv commons-dbcp2-2.9.0/commons-dbcp2-2.9.0.jar spark/jars \
      && wget https://mirror.its.dal.ca/apache//commons/pool/binaries/commons-pool2-2.10.0-bin.tar.gz\
      && tar -xvzf commons-pool2-2.10.0-bin.tar.gz \
      && mv commons-pool2-2.10.0/commons-pool2-2.10.0.jar spark/jars \
      #&& cd /css \
      #&& jar uf /spark/jars/spark-core_2.11-${SPARK_VERSION}.jar org/apache/spark/ui/static/timeline-view.css \
      && cd /


RUN mv /druid-spark-0.22.0-SNAPSHOT.jar /spark/jars

RUN mv /hdfs-site.xml /hadoop/etc/hadoop/
RUN mv /jets3t.properties /hadoop/etc/hadoop/

#Give permission to execute scripts
RUN chmod +x /wait-for-step.sh && chmod +x /execute-step.sh && chmod +x /finish-step.sh

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1
