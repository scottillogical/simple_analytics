#!/bin/sh
set -x

git push origin master 
if [ $? -eq 0 ]; then
  echo OK
else
  echo FAIL
  exit
fi

git push heroku master
if [ $? -eq 0 ]; then
  echo OK
else
  echo FAIL
  exit
fi


heroku run rake db:migrate 
if [ $? -eq 0 ]; then
  echo OK
else
  echo FAIL
  exit
fi

heroku restart --app conversion-funnel
if [ $? -eq 0 ]; then
  echo OK
else
  echo FAIL
  false
  exit
fi

