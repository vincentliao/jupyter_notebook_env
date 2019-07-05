FROM python:3.7-alpine

MAINTAINER vincentliao<vincentliao@gmail.com>

RUN apk update \
 && apk add --no-cache gcc build-base \
 && apk add --no-cache pkgconfig freetype libc-dev linux-headers freetype-dev libpng-dev zlib-dev \
 && apk add --no-cache libxml2 libxml2-dev libxslt libxslt-dev \
 && apk add --no-cache py-zmq py-numpy python3-dev \
 && apk add --no-cache py-scipy

# installation of jupyter, matplotlib
RUN pip3 install --upgrade --no-cache-dir pip \
 && pip3 install --no-cache-dir jupyter \
 && pip3 install --no-cache-dir matplotlib

# installation of scipy.
RUN apk --no-cache add lapack libstdc++ \
 && apk --no-cache add --virtual .builddeps g++ gfortran musl-dev lapack-dev \
 && pip3 install --upgrade --no-cache-dir scipy \
 && apk del .builddeps \
 && rm -rf /root/.cache

RUN apk add --no-cache libjpeg jpeg-dev \
 && pip3 install --upgrade --no-cache-dir bokeh

RUN pip3 install pandas lxml html5lib bs4

EXPOSE 8888
WORKDIR /workspace

COPY jupyter_notebook_config.py /root/.jupyter/

ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--port=8888"]
