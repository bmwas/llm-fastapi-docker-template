from fastapi.testclient import TestClient
from main import get_application


def test_chat_falcon() -> None:
    app = get_application()
    with TestClient(app) as client:
        response = client.post(
            "/v1/chat/completions",
            json={
                "model": "falcon-7b-instruct",
                "messages": [{"role": "user", "content": "Hello!"}],
            },
        )
        assert response.status_code == 200
