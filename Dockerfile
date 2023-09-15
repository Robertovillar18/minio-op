FROM minio/minio:latest

ENV PATH=/opt/bin
ENV FOLDER_PATH=${PATH}/server
RUN mkdir -p $FOLDER_PATH

RUN touch ${PATH}/exec.sh 
RUN echo '#!/bin/sh' > ${PATH}/exec.sh
RUN echo "echo 'Hola'" >> ${PATH}/exec.sh
RUN echo 'tail -f /dev/null' >> ${PATH}/exec.sh

RUN touch ${PATH}/entrypoint.sh 
RUN echo '#!/bin/sh' > ${PATH}/entrypoint.sh
RUN echo "echo '${FOLDER_PATH}'" >> ${PATH}/entrypoint.sh
RUN echo 'tail -f /dev/null' >> ${PATH}/entrypoint.sh

EXPOSE 9000 9090

RUN chmod +x ${PATH}/exec.sh
ENTRYPOINT $(echo ${PATH}/exec.sh)
