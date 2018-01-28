#!/bin/bash

[ -z "$SPARK_MASTER_URL" ] && {export SPARK_MASTER_URL=spark://${SPARK_MASTER_NAME}:${SPARK_MASTER_PORT}}

echo "Submit application ${SPARK_APPLICATION_JAR_LOCATION} with main class ${SPARK_APPLICATION_MAIN_CLASS} to Spark master ${SPARK_MASTER_URL}"
echo "Passing arguments ${SPARK_APPLICATION_ARGS}"

/spark/bin/spark-submit \
    ${SPARK_ADDITIONAL_CONF} \
    --class ${SPARK_APPLICATION_MAIN_CLASS} \
    --master ${SPARK_MASTER_URL} \
    ${SPARK_APPLICATION_JAR_LOCATION} ${SPARK_APPLICATION_ARGS}
