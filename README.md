# ETM

### Get started (raspberry pi 4)
- open two terminal windows
- 1. `sudo processing`
- 2. `sudo python step-res.py`
- run processing scrip `MosquitoPoti.pde`


## References

- [USING POTENTIOMETERS WITH THE RASPBERRY PI](https://www.circuitbasics.com/using-potentiometers-with-raspberry-pi/)

## Debugging
`
pi@raspberrypi:~/repos/ETM $ sudo python step-res.py 
Traceback (most recent call last):
  File "step-res.py", line 71, in <module>
    publish.single("a0", value1, hostname="localhost")
  File "/usr/local/lib/python2.7/dist-packages/paho/mqtt/publish.py", line 232, in single
    protocol, transport, proxy_args)
  File "/usr/local/lib/python2.7/dist-packages/paho/mqtt/publish.py", line 167, in multiple
    client.connect(hostname, port, keepalive)
  File "/usr/local/lib/python2.7/dist-packages/paho/mqtt/client.py", line 941, in connect
    return self.reconnect()
  File "/usr/local/lib/python2.7/dist-packages/paho/mqtt/client.py", line 1075, in reconnect
    sock = self._create_socket_connection()
  File "/usr/local/lib/python2.7/dist-packages/paho/mqtt/client.py", line 3546, in _create_socket_connection
    return socket.create_connection(addr, source_address=source, timeout=self._keepalive)
  File "/usr/lib/python2.7/socket.py", line 575, in create_connection
    raise err
socket.error: [Errno 111] Connection refused
`
