FROM python:3.10-slim

# gcc is for build psutil in MacOS
RUN apt-get update && apt-get install -y runit gcc

# create the environment
RUN pip install promptflow && \
    pip install promptflow-tools && \
    pip install promptflow-azure && \
    pip install keyrings.alt && \
    pip install gunicorn && \
    pip install uvicorn && \
    pip install promptflow-vectordb==0.2.10 && \
    pip install scikit-learn && \
    pip cache purge

# marshmallow hotfix
RUN pip install marshmallow==3.23.2 && \
    pip cache purge