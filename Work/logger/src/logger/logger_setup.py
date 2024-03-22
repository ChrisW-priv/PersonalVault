import json
import logging.config
import logging.handlers
from pathlib import Path
# from typing import override


LOGGER = logging.getLogger(__name__)


def setup_logging(logger_config='logger.conf.json'):
    THIS_DIR = Path(__file__).resolve().parent
    config_file = THIS_DIR / Path(logger_config)
    with open(config_file) as f_in:
        config = json.load(f_in)
    logging.config.dictConfig(config)


class NonErrorFilter(logging.Filter):
    # @override
    def filter(self, record: logging.LogRecord) -> bool | logging.LogRecord:
        return record.levelno <= logging.WARNING
