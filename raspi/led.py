import urllib2
import time

def rain(controllerURL, valveID, rainTime):
    for x in range(1, 9):
        if (x==valveID):
            urllib2.urlopen(controllerURL + "/?pin=ON" + str(x)).read()
            time.sleep(rainTime)
            urllib2.urlopen(controllerURL + "/?pin=OFF" + str(x)).read()
            time.sleep(1)
            print(x)

# function call: controllerURL, valveID, rainTime
rain ("http://192.168.0.110", 1, 1)
