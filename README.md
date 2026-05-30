# Spark Notebook Template

Dockerized Jupyter + PySpark environment, designed to be used from IntelliJ IDEA.

## Requirements

- Podman

## Start

```bash
podman compose up --build
```

## Connect from your IDE

To connect from the IDE two things have to be configured:
- Add a Jupyter server pointing to `http://localhost:8888` (runtime).
- Configure the python interpreter to pick the one from inside the docker-compose.

Notebooks are saved in the `notebooks/` folder on your machine.

## Add dependencies

Edit `pyproject.toml`, then rebuild:

```bash
podman compose up --build
```
