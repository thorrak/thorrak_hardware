BrewPi Sensor Boards
====================

The BrewPi sensor boards are intended to allow the DS18b20 temperature sensors (and optionally, door switch) to be connected to a PCB that is away from your main BrewPi controller, thereby allowing for the use of shorter temperature sensor cables - or for the placement of the sensor breakout inside your fermentation chamber if necessary. The sensor boards are then intended to be connected to the main controller board through the use of a cable.

All the up-to-date "main" controller board designs use RJ-45 jacks and are intended to be paired with the RJ-45 Breakout Board:



| Design                                               | Order                                                 | Jack Type | Cost from OshPark |
| ---------------------------------------------------- | ----------------------------------------------------- | --------- | ----------------- |
| [RJ-45 Breakout Board](RJ-45%20Sensor%20Breakout.md) | [Order](https://oshpark.com/shared_projects/5gqoDyRn) | RJ-45     | $9.60 (for 3)     |



## Legacy Breakout Board Designs

Older versions of the "main" controller board designs used RJ-11 jacks and were intended to be connected via elephone cables. Unfortunately, telephone cables are frequently found in both the "straight through" and "crossover" versions, and as a result many builds failed as a result of using the wrong cable type.

**New builds should use the RJ-45 boards.** Users with older controller PCBs that need the RJ-11 breakout board design can find it in the "legacy" folder in this repo.

