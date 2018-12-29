#!/bin/bash
. /appenv/bin/activate 
exec $@ 


# activate the virtual env, and execute the passed script
# example usage: entrypoint.sh python manage.py test
# will activate and then execute "python manage.py test"
# "exec" will make sure application is terminated correctly