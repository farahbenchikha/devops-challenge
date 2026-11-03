# syntax=docker/dockerfile:1

FROM python:3.12-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5000

FROM base AS runtime

# Create a non-root system user and group (UID/GID 10001)
RUN groupadd --system --gid 10001 appgroup && \
    useradd --system --uid 10001 --gid appgroup --no-create-home --shell /usr/sbin/nologin appuser

WORKDIR /app

# Copy application source with proper ownership
COPY --chown=appuser:appgroup app/ ./app/

# Run as non-root user
USER 10001:10001

EXPOSE 5000

CMD ["python", "app/app.py"]