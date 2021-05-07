FROM gcr.io/npav-172917/spark-backfill-base:2.4.5-scala2.12

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

COPY master.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs
ENV JAVA_HOME "/usr/lib/jvm/default-jvm"
ENV PATH "/spark/bin:/hadoop/bin:$JAVA_HOME:$PATH"
RUN export SPARK_DIST_CLASSPATH=$(/hadoop/bin/hadoop classpath);echo $SPARK_DIST_CLASSPATH;  

EXPOSE 8080 7077 6066

CMD ["/bin/bash", "/master.sh"]
