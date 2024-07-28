FROM node:22.5.1-alpine AS frontend-builder
WORKDIR /app/frontend
COPY frontend/ .
RUN npm install
RUN npm run build

FROM mambaorg/micromamba:1.5.8
WORKDIR /app/frontend/dist
COPY --chown=$MAMBA_USER:$MAMBA_USER --from=frontend-builder /app/frontend/dist/ .

WORKDIR /app/backend
COPY --chown=$MAMBA_USER:$MAMBA_USER backend/ .
RUN micromamba install -q -y -n base -f environment.yml && micromamba clean -q --all --yes

ARG MAMBA_DOCKERFILE_ACTIVATE=1
ENV PYTHONUNBUFFERED=1
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "python", "./main.py"]