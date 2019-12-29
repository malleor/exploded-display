venv:
	pip3 install virtualenv
	virtualenv venv

deps:
	. venv/bin/activate; pip install -r requirements.txt

install: venv deps
	sudo ln -s $(shell pwd) /opt/

notebook: export HOST=$(shell hostname -I)
notebook:
	. venv/bin/activate; venv/bin/jupyter notebook --ip=$(HOST) --port=8080
