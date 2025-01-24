FROM mcr.microsoft.com/azureml/openmpi4.1.0-ubuntu20.04:20230919.v1

# gcc is for build psutil in MacOS
RUN apt-get update && apt-get install -y runit gcc

RUN pip install -U pip && pip cache purge

# create the environment
RUN pip install promptflow && \
    pip install promptflow-tools && \
    pip install promptflow-azure && \
    pip install keyrings.alt && \
    pip install gunicorn && \
    pip install uvicorn && \
    pip cache purge

# Core common dependencies
RUN pip install langdetect==1.0.9 && \
    pip install promptflow-vectordb[azure]==0.2.9 && \
    pip install scikit-learn && \
    pip cache purge

# Additional common dependencies (less common)
RUN pip install markdown && \
    pip install bs4 && \
    pip cache purge
