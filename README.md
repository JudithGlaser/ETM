# Embracing the mess

## ETM experiments
The **Typo Tests** folder collects a number of typography focused interactive Processing sketches. As they arose from a exploration phase these are developed to different degrees. Each test contains a gif to give a preview of the effect. 

The **DeformShaderTest** documents the efforts to translate the desired "diffraction" effect by means of a shader. Thanks to @m3000 for making this possible. 

## ETM exhibit

### Get started (raspberry pi 4)
- install Raspian on your Pi ([Raspberry Pi Imager](https://www.raspberrypi.org/%20downloads/))
- install [Prosessing onto your existing installation](https://pi.processing.org/download/) `curl https://processing.org/download/install-arm.sh | sudo sh` 
- install `MQTT` library for Processing (via Processing -> Libraries)
- install Mosquitto via command line `apt-get install mosquitto`
- then start the MQTT service `mosquitto -d && sudo systemctl enable mosquitto.service`
- install Paho-mqtt via command line `pip3 install paho-mqtt` if using Python 3; `pip install paho-mqtt` for Python 2

### Export ETM_Sketch
- start processing `sudo processing`
- Make sure there is no `application...` folder in the Sketch's folder
	- `sudo rm -rf application.linux*`
- Export Application with File -> Export Application
- Choose "Linux", "Present mode", "No Stop Button", "Include Java"

### Run Exported Sketch
The **step-res.py** script basically reads the poti values and submits it via [MQTT](https://github.com/msurguy/processing-mqtt-sensor-demo) to Processing. The **ETM_Sketch** file includes the Processing files to run the animation and receive the poti values. 
 
- run python script `sudo python step-res.py`
- direct to exported sketch `cd ~/repos/ETM/ETM_Sketch`
- run sketch `bash application.linux-armv6hf/ETM_Sketch`

## References

- [USING POTENTIOMETERS WITH THE RASPBERRY PI](https://www.circuitbasics.com/using-potentiometers-with-raspberry-pi/)
- [MQTT > Processing bridge for I2C sensors](https://github.com/msurguy/processing-mqtt-sensor-demo)
- [KineticTypographyny by Tim Rodenbroeker](https://timrodenbroeker.de/processing-tutorial-kinetic-typography-1/)
- [The book of shader](https://thebookofshaders.com/09/)
