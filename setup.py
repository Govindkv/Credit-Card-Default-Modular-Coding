import setuptools
from setuptools import setup, find_packages

with open("README.md","r", encoding="utf-8") as f:
    long_description = f.read()


__version__ = "0.0.0"


REPO_NAME="Research_Deployment_Practices"
AUTHOR_USER_NAME ="Govindkv"
SRC_REPO = "ccdp"
AUTHOR_EMAIL="Govind26663355@gmail.com"

setuptools.setup(
    name=REPO_NAME,
    version=__version__,
    author= AUTHOR_USER_NAME,
    author_email=AUTHOR_EMAIL,
    description="A small Python package for Predicting Credit Card Default.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url=f"https://github.com/{AUTHOR_USER_NAME}/{REPO_NAME}",
    project_urls={
        "Bug Tracker": f"https://github.com/{AUTHOR_USER_NAME}/{REPO_NAME}/issues"
    },
    package_dir={"": "src"},
    packages=setuptools.find_packages(where="src")
)