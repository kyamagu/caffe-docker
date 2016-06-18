FROM caffe:gosu

# This sets up jupyter notebook server.
#
#    docker build -t caffe:jupyter jupyter/
#    docker run -it -p 8888:8888 caffe:jupyter


# Get pip.
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

ENV PYTHONWARNINGS="ignore:a true SSLContext object"
RUN pip --no-cache-dir install \
        ipykernel \
        jupyter \
        matplotlib \
        sklearn \
        hmmlearn \
        && \
    python -m ipykernel.kernelspec

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents
# kernel crashes.
#
# See http://jupyter-notebook.readthedocs.io/en/latest/public_server.html#docker-cmd
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini

EXPOSE 8888

CMD ["/usr/bin/tini", "--", "jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
