FROM minio/minio:latest

ENV TMP=/opt/bin
# ENV TMP=/tmp

RUN touch ${TMP}/exec.sh 
RUN echo '#!/bin/sh' > ${TMP}/exec.sh
RUN echo "echo 'Hola'" >> ${TMP}/exec.sh
RUN echo 'tail -f /dev/null' >> ${TMP}/exec.sh

RUN chmod +x ${TMP}/exec.sh
ENTRYPOINT $(echo ${TMP}/exec.sh)
