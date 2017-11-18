FROM jupyterhub/singleuser:latest

RUN pip install numpy scipy matplotlib pandas ipywidgets scikit-learn xgboost

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension

USER root
RUN apt-get update
