import json
import sys
import pdb

json_dat = open(sys.argv[1])
jdata = json.load(json_dat)

if(not type(jdata) == list):
    jdata = [jdata]

max_len = 20
for i in range(len(jdata)):
    for key, value in jdata[i].items():
        if(type(value) == list and 
           len(value) > max_len):
            jdata[i][key]='placeholder'
        if(key == 'data'): 
            jdata[i][key]='placeholder'
    print(json.dumps(jdata[i], indent=2))


