# Spark Notebook Template

Dockerized Jupyter + PySpark environment, designed to be used from IntelliJ IDEA.

## Requirements

- Podman

## Start

```bash
podman compose up --build
```

## Connect from IntelliJ

1. Open a `.ipynb` file in IntelliJ
2. Click the kernel selector → **Add Jupyter Server** → **Configured Server**
3. Enter `http://localhost:8888` — no token needed

Notebooks are saved in the `notebooks/` folder on your machine.

## Add dependencies

Edit `pyproject.toml`, then rebuild:

```bash
docker compose up --build
```
