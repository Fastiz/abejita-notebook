FROM docker.io/library/eclipse-temurin:17-jdk-noble

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

WORKDIR /app

COPY pyproject.toml .python-version ./

RUN uv sync --no-cache

RUN /app/.venv/bin/python -c "\
import urllib.request; \
urllib.request.urlretrieve(\
'https://repo1.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/3.4.1/mariadb-java-client-3.4.1.jar',\
'/app/mariadb-connector.jar')"

ENV JDK_JAVA_OPTIONS="--add-modules=jdk.incubator.vector"
ENV PATH="/app/.venv/bin:$PATH"
ENV PYSPARK_PYTHON=/app/.venv/bin/python
ENV PYSPARK_DRIVER_PYTHON=/app/.venv/bin/python

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--notebook-dir=/app/notebooks", "--ServerApp.token=", "--ServerApp.password="]
