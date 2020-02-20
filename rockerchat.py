#!/usr/bin/python

import sys
import requests

url     = sys.argv[1]
body    = sys.argv[2]
body = body.encode(encoding='utf-8')

r = requests.post(url, body)
