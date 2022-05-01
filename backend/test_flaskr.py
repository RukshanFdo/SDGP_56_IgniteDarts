import os
import tempfile

import pytest

from app import app


@pytest.fixture
def client():
    db_fd, app.config['recipe'] = tempfile.mkstemp()
    app.config['test_client'] = True

    with app.test_client() as client:
        with app.app_context():
            app.init_db()
        yield client

    os.close(db_fd)
    os.unlink(app.config['recipe'])

