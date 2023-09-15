FROM minio/minio:latest

ENV PATH=/opt/bin
# ENV FOLDERPATH=${PATH}/server
# RUN mkdir -p /opt/bin/server

RUN touch ${PATH}/exec.sh 
RUN echo '#!/bin/sh' > ${PATH}/exec.sh
RUN echo "echo 'Hola'" >> ${PATH}/exec.sh
RUN echo 'tail -f /dev/null' >> ${PATH}/exec.sh

# RUN touch ${PATH}/entrypoint.sh 
# RUN echo '#!/bin/sh' > ${PATH}/entrypoint.sh
# RUN echo "mkdir '${FOLDER_PATH}'" >> ${PATH}/entrypoint.sh
# RUN echo "echo '${FOLDER_PATH}'" >> ${PATH}/entrypoint.sh
# RUN echo 'tail -f /dev/null' >> ${PATH}/entrypoint.sh

EXPOSE 9000 9090

RUN chmod +x ${PATH}/exec.sh
# RUN chmod +x ${PATH}/entrypoint.sh
ENTRYPOINT $(echo ${PATH}/exec.sh)
