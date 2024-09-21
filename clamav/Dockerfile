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

RUN echo "DatabaseMirror database.clamav.net" > ${LAMBDA_TASK_ROOT}/freshclam.conf
RUN echo "CompressLocalDatabase yes" >> ${LAMBDA_TASK_ROOT}/freshclam.conf
#RUN echo "HTTPProxyServer proxy.com" >> ${LAMBDA_TASK_ROOT}/freshclam.conf
RUN echo "HTTPProxyPort 80" >> ${LAMBDA_TASK_ROOT}/freshclam.conf
RUN echo "DatabaseOwner root" >> ${LAMBDA_TASK_ROOT}/freshclam.conf

#COPY requirements.txt ${LAMBDA_TASK_ROOT}
#RUN pip install -r requirements.txt --target ${LAMBDA_TASK_ROOT}
#COPY src/ ${LAMBDA_TASK_ROOT}
#RUN chmod 755 -R ${LAMBDA_TASK_ROOT}
#CMD ["handler.handler"]

EXPOSE 3310