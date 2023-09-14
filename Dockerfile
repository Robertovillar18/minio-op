FROM minio/minio:latest

ENV PATH=/opt/bin:$PATH

RUN touch ${PATH}/exec.sh 
RUN echo '#!/bin/sh' > ${PATH}/exec.sh
RUN echo "echo 'Hola'" >> ${PATH}/exec.sh
RUN echo 'tail -f /dev/null' >> ${PATH}/exec.sh

RUN chmod +x ${PATH}/exec.sh
ENTRYPOINT $(echo ${PATH}/exec.sh)
