# Embracing The Mess
›Embracing the mess‹ is an interactive installation and initially emerged as a result of the examination of my own research process. Beyond the discourse of theory and practice, of (knowledge) models and methodological restraints, of epistemic sovereignty and hegemony, the question is – what does research mean for the research object and for the researcher?

Karen Barad invites us to understand research as a practice of cutting. Cuts make some aspects of a research object visible, others not. On the premise that observer and phenomenon are intertwined, each cut separates and creates different forms of visibility and invisibility. Where the traces of the research process undertaken obscure parts of the object, the (in)sight of the researcher will also always be partial. How we cut, how we make visible, affects how we understand what we think we are researching.

It is against this background that ›Embracing the mess‹ references and misunderstands the contrasting optical metaphors of reflectivity and diffraction. As a ›diffraction apparatus‹ it invites those searching to play with interference and difference. The exploration of an always-incomplete object. A balancing act between revealing and concealing, sharpness and fuzziness. Inquiring how researchers and their research practices are involved in the becoming of the object. As a ›mirror‹, the installation does not throw the research object back on itself, but the researcher. Research as a process that changes not only the object but also the researcher. Through this reverse reference, the installation explores the sensual-emotional dimension of research and finally asks about its significance for epistemological processes. 

![Alt Text](https://github.com/JudithGlaser/ETM/blob/main/ETM_Sketch/demo/exhibit.png)
![Alt Text](https://github.com/JudithGlaser/ETM/blob/main/ETM_Sketch/demo/demo1.gif)


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
