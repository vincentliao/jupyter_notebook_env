FROM python:3.7-alpine

MAINTAINER vincentliao<vincentliao@gmail.com>

VOLUME "/workspace"
WORKDIR "/workspace"

RUN apk update
RUN apk add --no-cache gcc build-base
RUN apk add --no-cache pkgconfig freetype libc-dev linux-headers freetype-dev libpng-dev libxml2-dev zlib-dev
RUN apk add --no-cache py-zmq py-numpy python3-dev
RUN apk add --no-cache py-scipy

# installation of jupyter, matplotlib
RUN pip3 install --upgrade --no-cache-dir pip
RUN pip3 install --no-cache-dir jupyter
RUN pip3 install --no-cache-dir matplotlib  

# installation of scipy.
RUN apk --no-cache add lapack libstdc++ \
 && apk --no-cache add --virtual .builddeps g++ gfortran musl-dev lapack-dev \     
 && pip3 install --upgrade --no-cache-dir scipy \
 && apk del .builddeps \
 && rm -rf /root/.cache

RUN apk add --no-cache libjpeg jpeg-dev \
 && pip3 install --upgrade --no-cache-dir bokeh

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--port=8888"]

