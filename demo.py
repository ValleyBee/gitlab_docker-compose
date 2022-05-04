import logging
logging.basicConfig(level=logging.DEBUG)
logging.debug("debug")
logging.info("info")
logging.warning("warning")
logging.error("error")
logging.critical("critical")


def print_x(x):
    print(f"{x}")


if "__main__" == __name__:
    print_x(2)
