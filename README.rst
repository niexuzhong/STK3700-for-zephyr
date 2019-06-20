

STK3700 board porting for zephyr
##############

Overview
********

it is porting sample for zephyr for stk3700 siliconlabs 

The LED will start at a blinking frequency of 1 Hz. if you can connect terminal with board, it will display "hello world" at same frequency

operation
******
  - Download 'script communicator <https://sourceforge.net/projects/scriptcommunicator/>' as terminal
  - Download 'segger driver <https://www.segger.com/downloads/jlink/#J-LinkSoftwareAndDocumentationPackBeta>' and install driver as your OS
  - connect usb cable with PC.run script communicator ,select the port and baud rate as 115200
  - run jlinkgdbserver
  - run d script
  - input "cont" in GDB command line, program begin to run.


porting process
******
   - install 'west and zephyr-sdk <https://docs.zephyrproject.org/latest/getting_started/index.html>',create project directory then run "west init" and "west update" to get the latest zephyr
   - copy silabs directory to the directory zephyr/dts/arm/silabs
   - add such line "zephyr_sources_ifdef(CONFIG_SOC_SERIES_EFM32GG  Device/SiliconLabs/EFM32GG/Source/system_efm32gg.c)" to the file module/ext/hal/silabs/gecko/CMakeLists.txt as the file in directory silabs/gecko/CMakeLists.txt
   - Download gecko_sdk_suite from silabs.you can aslo install simplicitystudio or get it from MDK pack. then you can find the sdk directory from the directory,copy them(EFM32G) to the directory modules/hal/silabs/gecko/Device/SiliconLabs.(if you use old version. this directory is at ext/hal/silabs)
   - run the build.sh to generate the coniguration .then input "cd build" to run command: "ninja "then wait for generating elf file,
   - tested on ubuntu and debian
   - 'STK3700 starter kit <https://www.silabs.com/products/mcu/32-bit/efm32-giant-gecko>'
