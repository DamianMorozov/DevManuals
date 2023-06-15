# Python

- [Python.org](https://python.org/)
- [Configure your local Python dev environment for Azure](https://learn.microsoft.com/en-us/azure/developer/python/configure-local-development-environment)

## Helpers
```
python --help									## print help
python --help-env								## print help about Python environment variables and exit
python --help-xoptions							## print help about implementation-specific -X options and exit
python --help-all								## print complete help information and exit
python -m venv venv source venv/bin/activate	## create and activate a Python virtual environment named "venv" for the current project
python -m pip install --upgrade pip				## pip reads the file and installs all the packages listed in it, along with their dependencies
pip install -r requirements.txt
python run.py
```

## Configure your local Python dev environment for Azure
```
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
python run.py
```
