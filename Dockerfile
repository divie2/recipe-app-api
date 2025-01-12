FROM python:3.9-alpine3.13
LABEL maintainer="divine-recipe.com"

# Environment variables
ENV PYTHONUNBUFFERED=1 PATH="/py/bin:$PATH"

# Set build-time argument for development mode
ARG DEV=false

# Install system dependencies and Python virtual environment
RUN apk add --update --no-cache \
    postgresql-client build-base postgresql-dev musl-dev && \
    python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache --virtual .tmp-build-deps \
    build-base postgresql-dev musl-dev

# Install Python dependencies
COPY ./requirements.txt /tmp/requirements.txt
RUN /py/bin/pip install -r /tmp/requirements.txt

# Install additional development dependencies if needed
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
RUN if [ "$DEV" = "true" ]; then /py/bin/pip install -r /tmp/requirements.dev.txt; fi

# Remove temporary files and build dependencies
RUN rm -rf /tmp && \
    apk del .tmp-build-deps

# Copy application code
COPY ./app /app
WORKDIR /app

# Create a non-root user
RUN adduser --disabled-password --no-create-home django-user
USER django-user

# Expose port 8000
EXPOSE 8000

# Default command
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
