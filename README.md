# Serve an LLM using FastAPI and Docker

Blog post available at: https://dev.premai.io/blog/llm-fastapi-docker

## Docker Commands

### Build the Docker Image

```bash
docker buildx build --push \
    --cache-from ghcr.io/premai-io/chat-falcon-7b-instruct-gpu:latest \
    --file ./Dockerfile \
    --build-arg="MODEL_ID=tiiuae/falcon-7b-instruct" \
    --tag ghcr.io/premai-io/chat-falcon-7b-instruct-gpu:latest \
    --tag ghcr.io/premai-io/chat-falcon-7b-instruct-gpu:0.0.1 \
    .
```

### Run the application using Docker

```bash
docker run --gpus all -p 8000:8000 ghcr.io/premai-io/chat-falcon-7b-instruct-gpu:latest
```