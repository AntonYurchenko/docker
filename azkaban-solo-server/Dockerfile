# Builder Image
FROM ubuntu:16.04 AS builder

ENV AZKABAN_VERSION "3.30.1"

## Installation necessary tools and building Azkaban Solo Server
RUN \
    apt-get update && apt-get install -y openjdk-8-jdk git && \
    git clone -b ${AZKABAN_VERSION} https://github.com/azkaban/azkaban.git /tmp/azkaban && \
    cd /tmp/azkaban && \
    ./gradlew clean installDist -x test


## Target image
FROM alpine:3.10.2 AS runtime

## Time zone internal comtainer, by default Moscow (+03:00)
ENV TIME_ZONE "Europe/Moscow"
ENV WORK_DIR "/opt/azkaban-solo-server-${AZKABAN_VERSION}"
ENV CONF_FILE "${WORK_DIR}/conf/azkaban.properties"

## Azkaban configuration
ENV DEFAULT_TIME_ZIME_ID "Etc/GMT-3"
ENV LOCKDOWN_CREATE_PROJECTS "true"
ENV AZKABAN_NAME "Project name"
ENV AZKABAN_LABEL "Project description"
ENV AZKABAN_COLOR "#FF3601"
ENV AZKABAN_PORT 8081
ENV AZKABAN_MAIL_SENDER ""
ENV AZKABAN_MAIL_HOST ""
ENV AZKABAN_JOB_FAILURE_EMAIL ""
ENV AZKABAN_JOB_SUCCESS_EMAIL ""

## Copying Azkaban Solo Server from builder container
COPY --from=builder --chown=root:root /tmp/azkaban/azkaban-solo-server/build/install/azkaban-solo-server ${WORK_DIR}

## Installation jre, time zone and bash. Creation target directory
RUN \
    apk add --no-cache openjdk8-jre tzdata bash && \
    mkdir -p /var/azkaban

WORKDIR ${WORK_DIR}

## Tuning configuration and running Azkaban Solo Server
CMD \
    cp "/usr/share/zoneinfo/${TIME_ZONE}" /etc/localtime && \
    echo ${TIME_ZONE} > /etc/timezone && \
    cp "${WORK_DIR}/conf/azkaban-users.xml" /var/azkaban/azkaban-users.xml && \
    cp -r "${WORK_DIR}/plugins" /var/azkaban/plugins && \
    sed -ri "s:(user.manager.xml.file)=.+:\1=/var/azkaban/azkaban-users.xml:g" ${CONF_FILE} && \
    sed -ri "s:(azkaban.jobtype.plugin.dir)=.+:\1=/var/azkaban/plugins/jobtypes:g" ${CONF_FILE} && \
    sed -ri "s:(azkaban.project.dir)=.+:\1=/var/azkaban/projects:g" ${CONF_FILE} && \
    sed -ri "s:(h2.path)=.+:\1=/var/azkaban/h2:g" ${CONF_FILE} && \
    sed -ri "s:(default.timezone.id)=.+:\1=${DEFAULT_TIME_ZIME_ID}:g" ${CONF_FILE} && \
    sed -ri "s:(lockdown.create.projects)=.+:\1=${LOCKDOWN_CREATE_PROJECTS}:g" ${CONF_FILE} && \
    sed -ri "s:(azkaban.name)=.+:\1=${AZKABAN_NAME}:g" ${CONF_FILE} && \
    sed -ri "s:(azkaban.label)=.+:\1=${AZKABAN_LABEL}:g" ${CONF_FILE} && \
    sed -ri "s:(azkaban.color)=.+:\1=${AZKABAN_COLOR}:g" ${CONF_FILE} && \
    sed -ri "s:(jetty.port)=.+:\1=${AZKABAN_PORT}:g" ${CONF_FILE} && \
    sed -ri "s:(mail.sender)=.+:\1=${AZKABAN_MAIL_SENDER}:g" ${CONF_FILE} && \
    sed -ri "s:(mail.host)=.+:\1=${AZKABAN_MAIL_HOST}:g" ${CONF_FILE} && \
    sed -ri "s:(job.failure.email)=.+:\1=${AZKABAN_JOB_FAILURE_EMAIL}:g" ${CONF_FILE} && \
    sed -ri "s:(job.success.email)=.+:\1=${AZKABAN_JOB_SUCCESS_EMAIL}:g" ${CONF_FILE} && \
    bin/azkaban-solo-start.sh && \
    trap "bin/azkaban-solo-shutdown.sh" SIGINT SIGTERM && \
    PID=$(cat currentpid); while [ -e "/proc/${PID}" ]; do sleep .6; done