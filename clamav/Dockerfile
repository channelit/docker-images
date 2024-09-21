FROM registry.access.redhat.com/ubi8/ubi:latest As clam-build

ENV CLAM_VERSION=1.4.1


RUN mkdir -p /opt/clamav
RUN curl -LSo /opt/clamav/clamav.rpm https://www.clamav.net/downloads/production/clamav-${CLAM_VERSION}.linux.x86_64.rpm
RUN yum localinstall -y --disableplugin=subscription-manage /opt/clamav/clamav.rpm


FROM public.ecr.aws/lambda/python:3.12

ENV	LAMBDA_TASK_ROOT="/var/task"

COPY --from=clam-build /usr/local/bin/clamscan ${LAMBDA_TASK_ROOT}
COPY --from=clam-build /usr/local/bin/freshclam ${LAMBDA_TASK_ROOT}
COPY --from=clam-build /usr/local/lib64/*.so.* ${LAMBDA_TASK_ROOT}/
COPY --from=clam-build /etc/pki/ca-trust/source/anchors/* /etc/pki/ca-trust/source/anchors/
COPY --from=clam-build /opt /opt

RUN yum install ca-certificates -y
RUN update-ca-trust
RUN update-ca-trust force-enable

RUN echo "DatabaseMirror database.clamav.net" > ${LAMBDA_TASK_ROOT}/freshclam.conf
RUN echo "CompressLocalDatabase yes" >> ${LAMBDA_TASK_ROOT}/freshclam.conf
#RUN echo "HTTPProxyServer proxy.com" >> ${LAMBDA_TASK_ROOT}/freshclam.conf
RUN echo "HTTPProxyPort 80" >> ${LAMBDA_TASK_ROOT}/freshclam.conf
RUN echo "DatabaseOwner root" >> ${LAMBDA_TASK_ROOT}/freshclam.conf

#COPY classes ${LAMBDA_TASK_ROOT}
#COPY dependency/* ${LAMBDA_TASK_ROOT}/lib/

EXPOSE 3310