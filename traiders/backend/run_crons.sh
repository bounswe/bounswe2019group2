#!/usr/bin/env bash

while :
do
	python manage.py updateparities;
	sleep 60;
done
