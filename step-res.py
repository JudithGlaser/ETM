####################################
#         Analog Read Code         #
#         by Simon Monk            #
#         modified by Don Wilcher  #
#         Jan 1/31/15              #
####################################

# include RPi libraries in to Python code
import RPi.GPIO as GPIO
import time
import paho.mqtt.publish as publish

# instantiate GPIO as an object
GPIO.setmode(GPIO.BCM)

# define GPIO pins with variables a_pin and b_pin
a_pin1 = 18
b_pin1 = 23

a_pin2 = 18
b_pin2 = 23

# create discharge function for reading capacitor data
def discharge1():
    GPIO.setup(a_pin, GPIO.IN)
    GPIO.setup(b_pin, GPIO.OUT)
    GPIO.output(b_pin, False)
    time.sleep(0.005)

# create time function for capturing analog count value
def charge_time1():
    GPIO.setup(b_pin, GPIO.IN)
    GPIO.setup(a_pin, GPIO.OUT)
    count = 0
    GPIO.output(a_pin, True)
    while not GPIO.input(b_pin):
        count = count +1
    return count

# create analog read function for reading charging and discharging data
def analog_read1():
    discharge1()
    return charge_time1()

# create discharge function for reading capacitor data
def discharge2():
    GPIO.setup(a_pin2, GPIO.IN)
    GPIO.setup(b_pin2, GPIO.OUT)
    GPIO.output(b_pin2, False)
    time.sleep(0.005)

# create time function for capturing analog count value
def charge_time2():
    GPIO.setup(b_pin2, GPIO.IN)
    GPIO.setup(a_pin2, GPIO.OUT)
    count = 0
    GPIO.output(a_pin2, True)
    while not GPIO.input(b_pin2):
        count = count +1
    return count

# create analog read function for reading charging and discharging data
def analog_read2():
    discharge2()
    return charge_time2()

# provide a loop to display analog data count value on the screen
while True:
    value1 = analog_read1()
    value2 = analog_read2()
    publish.single("a0", value1, hostname="localhost")
    publish.single("a1", value2, hostname="localhost")
    time.sleep(0.016)
