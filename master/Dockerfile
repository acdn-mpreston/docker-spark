FROM gcr.io/npav-172917/spark-backfill-base:2.4.5-scala2.12

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

COPY master.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs
ENV JAVA_HOME "/usr/lib/jvm/default-jvm"
ENV PATH "/spark/bin:/hadoop/bin:$JAVA_HOME:$PATH"
ENV SPARK_DIST_CLASSPATH="/hadoop/etc/hadoop:/hadoop/share/hadoop/common/lib/*:/hadoop/share/hadoop/common/*:/hadoop/share/hadoop/hdfs:/hadoop/share/hadoop/hdfs/lib/*:/hadoop/share/hadoop/hdfs/*:/hadoop/share/hadoop/yarn/lib/*:/hadoop/share/hadoop/yarn/*:/hadoop/share/hadoop/mapreduce/lib/*:/hadoop/share/hadoop/mapreduce/*:/contrib/capacity-scheduler/*.jar"

EXPOSE 8080 7077 6066

CMD ["/bin/bash", "/master.sh"]
