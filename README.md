# ROS Message De-Serializer [![View Message-De-Serializer-for-ROS on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/105815-message-de-serializer-for-ros)
This project relies on [ROS Toolbox](https://www.mathworks.com/products/ros.html) functionality to provide basic integration of Simulink® targets, with focus on [Simulink Real-Time™](https://www.mathworks.com/products/simulink-real-time.html) and [Speedgoat®](https://www.speedgoat.com), into ROS/ROS2 networks via message serialization. The project leverages existing API from the ROS Toolbox in some MATLAB® System blocks to process ROS/ROS2 messages over UDP or Serial communication.

The project contains a small set of Serialize and De-Serialize blocks in a library together with some simple model examples.

## Setup
### MathWorks products
Requires MATLAB release R2020b or newer.
- MATLAB
- Simulink
- ROS Toolbox
- Instrument Control Toolbox™ (optional)
- Simulink Real-Time (optional)

## Getting Started
1. Start the Simulink project `ROSMessageSerializer.prj`.
2. ROS/ROS2 (De-)Serializer blocks will be added to the Simulink library, available via the library browser or the Simulink block search.
3. Open any Simulink model example located in the `examples` folder and get familiar with different set-ups.

## Examples
To learn how to use this in testing workflows, see [examples](examples).

## License
The license is available in the [License file](license.txt) within this repository.

# Community Support
[MATLAB Central](https://www.mathworks.com/matlabcentral)

Copyright 2021 The MathWorks, Inc.
