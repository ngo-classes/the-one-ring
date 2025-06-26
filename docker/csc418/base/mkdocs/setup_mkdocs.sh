#!/bin/bash

python3 -m venv /opt/env/mkdocs
source /opt/env/mkdocs/bin/activate
pip install mkdocs-material
pip install markdown-include mkdocs-table-reader-plugin
