from logger.logger_setup import setup_logging
import logging


LOGGER = logging.getLogger(__name__)


def main():
    setup_logging()
    LOGGER.debug("debug message", extra={"x": "hello"})
    LOGGER.info("info message")
    LOGGER.warning("warning message")
    LOGGER.error("error message")
    LOGGER.critical("critical message")
    try:
        1 / 0
    except ZeroDivisionError:
        LOGGER.exception("exception message")


if __name__ == "__main__":
    main()
