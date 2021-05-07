FROM gcr.io/npav-172917/spark-backfill-base:2.4.5-scala2.12

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

COPY worker.sh /

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"
ENV JAVA_HOME "/usr/lib/jvm/default-jvm"
ENV PATH "/spark/bin:/hadoop/bin:$JAVA_HOME:$PATH"
RUN export SPARK_DIST_CLASSPATH=$(/hadoop/bin/hadoop classpath);echo $SPARK_DIST_CLASSPATH;  

EXPOSE 8081

CMD ["/bin/bash", "/worker.sh"]
