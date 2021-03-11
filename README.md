# ETM

### Get started (raspberry pi 4)
- open two terminal windows
- 1. `sudo processing`
- 2. `sudo python step-res.py`
- run processing scrip `MosquitoPoti.pde`


## Export Sketch

- Make sure there is no `application...` folder in the Sketch's folder
	- `sudo rm -rf application.linux*`
- Export Application with File -> Export Application
- Choose "Linux", "Present mode", "No Stop Button", "Include Java"

## Run Exported Sketch

- `cd ~/repos/ETM/ETM_Sketch`
- `bash application.linux-armv6hf/ETM_Sketch`

## References

- [USING POTENTIOMETERS WITH THE RASPBERRY PI](https://www.circuitbasics.com/using-potentiometers-with-raspberry-pi/)
