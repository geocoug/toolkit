import logging
from my_library import submodule

def main():
    logger = logging.getLogger("__main__")
    logger.info("Log message from main function in module.py")
    submodule.bar()

if __name__ == "__main__":
    main()