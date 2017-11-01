FROM nvidia/cuda:8.0-cudnn5-devel

RUN apt-get update && apt-get install -y --no-install-recommends \
    python \
    python-dev \
    curl

RUN curl -kO https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    sh Miniconda2-latest-Linux-x86_64.sh -b

ENV PATH=/root/miniconda2/bin:$PATH

RUN conda install -y \
     theano=0.9.0 \
     pygpu \
     tqdm \
     scikit-learn \
     Pillow

RUN pip install https://github.com/Lasagne/Lasagne/archive/master.zip

RUN echo '[global]\n\
device = cuda\n\
floatX = float32' >> /root/.theanorc
