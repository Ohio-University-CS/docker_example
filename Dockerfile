FROM debian:stable-slim

# Install curl + build tools (minimal)
RUN apt-get update && apt-get install -y curl ca-certificates \
    && update-ca-certificates

# Install uv (this also installs an internal Python toolchain automatically)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Add uv binary to PATH
ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /app

COPY pyproject.toml .
COPY config.json .
COPY app.py .

# uv will automatically install the correct Python version
RUN uv venv
RUN uv sync

CMD ["uv", "run", "app.py"]
