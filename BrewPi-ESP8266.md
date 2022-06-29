# Hardware for BrewPi-ESP8266

The BrewPi-ESP8266 project reimplements the BrewPi firmware on the ESP8266. A full BrewPi build typically requires one 
set of components for the PCB to which the ESP8266 is connected, one for the sensor breakout board, and then additional
"common" components which are connected to the other two PCBs, but do not themselves require assembly. A build will also
typically require some type of container to house everything.



| Component Group                                              | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ["Main" Controller PCB & BOM](ESP8266%20BrewPi%20Boards/README.md) | The main PCB that connects the ESP8266 to the other components |
| [Common Components](ESP8266%20BrewPi%20Boards/Common%20Components.md) | Components that are common across all builds of this project |
| ["Sensor Board" PCB & BOM](BrewPi%20Sensor%20Boards/README.md) | A PCB that connects to the temperature sensors               |
| [Main Container](BrewPi%20Containers/Main%20PCB%20Container/README.md) | 3D-printable containers for the "main" controller PCB, relay, PSU, and AC connectors |
| [Sensor Board Container](BrewPi%20Containers/Sensor%20Board%20Container/README.md) | 3D-printable containers for the "sensor board" PCB           |


# Controller Choice

The BrewPi-ESP project supports a number of different microcontrollers with differing features. Supported controllers include:

| **Microcontroller** | **DS18b20 Temp Sensors** | **Connected Relays** | **WiFi Support**   | **LCD2004 (IIC) Support** | **TFT Screen Support** | **Kasa WiFi Relay** | **Tilt/Inkbird Bluetooth Temp Sensors** |
|---------------------|--------------------------|----------------------|--------------------|---------------------------|------------------------|---------------------|-----------------------------------------|
| Arduino*            | :heavy_check_mark:       | :heavy_check_mark:   |                    | :heavy_check_mark:*       |                        |                     |                                         |
| ESP8266             | :heavy_check_mark:       | :heavy_check_mark:   | :heavy_check_mark: | :heavy_check_mark:        |                        |                     |                                         |
| ESP32               | :heavy_check_mark:       | :heavy_check_mark:   | :heavy_check_mark: | :heavy_check_mark:        | :heavy_check_mark:     | :heavy_check_mark:  | :heavy_check_mark:                      |
| ESP32-S2            | :heavy_check_mark:       | :heavy_check_mark:   | :heavy_check_mark: | :heavy_check_mark:        |                        | :heavy_check_mark:  |                                         |

Note - "Classic" BrewPi builds are based on Arduinos, which are shown in the table above for comparison. There is an (optional) IIC-compatible build of the Arduino firmware available, but "classic" builds did not support this feature.

