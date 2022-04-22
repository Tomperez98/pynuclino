class Nuclino:
    def __init__(self, max_retries: int) -> None:
        self.base_url: str = "https://api.nuclino.com/v0"
        self._max_retries = max_retries

    @property
    def max_retries(self) -> int:
        return self._max_retries

    @max_retries.setter
    def max_retries(self, max_retries: int) -> None:
        self._max_retries = max_retries
