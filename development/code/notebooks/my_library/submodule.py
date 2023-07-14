import logging

def bar():
    logger = logging.getLogger("__main__")
    logger.info("Hello from submodule.py in function bar()")