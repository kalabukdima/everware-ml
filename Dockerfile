FROM jupyterhub/singleuser:latest

RUN pip install numpy scipy matplotlib pandas ipywidgets scikit-learn

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension

USER root
RUN apt-get update && apt-get install -y build-essential git
# xgboost
RUN cd /usr/local/src && mkdir xgboost && cd xgboost && \
    git clone --depth 1 --recursive https://github.com/dmlc/xgboost.git && \
    cd xgboost && \
    make && cd python-package && python setup.py install && \
    pip install lightgbm
