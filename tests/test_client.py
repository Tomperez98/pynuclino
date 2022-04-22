from pynuclino import client


def test_client():
    n = client.Nuclino(max_retries=2)
    assert n.max_retries == 2
