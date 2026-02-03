# HEAD
# Sawyer Haptic Teleoperation Workspace

Docker environment for Sawyer robot teleoperation using Geomagic Touch haptic device.

## Prerequisites

Before using this Docker setup, you need to install the following **on your host machine**:

### 1. OpenHaptics SDK
- Download and install OpenHaptics from 3D Systems
- Default installation path: `~/OpenHaptics`

### 2. Touch Device Driver
- Download TouchDriver from 3D Systems
- Extract to a known location (e.g., `~/Downloads/TouchDriver_2024_09_19`)

### 3. Touch Libraries
Create a `~/TouchLibs` directory and place the following library files:
- `libPhantomManagerLite.so`
- `libPhantomIOLib42.so`
- `libHL.so.3.4.0`
- `libHD.so.3.4.0`
- `libHDU.a`

**Note:** These are proprietary libraries from 3D Systems and cannot be distributed. You must obtain them from your Touch device installation or SDK.

## Project Structure

```
sawyer-haptic-workspace/
├── Dockerfile              # Container environment setup
├── docker-compose.yml      # Easy container management
├── run.sh                  # Alternative run script
├── README.md               # This file
└── catkin_ws/
    └── src/
        ├── SAWYER/         # Your Sawyer packages here
        ├── Geomagic_Touch_ROS_Drivers/
        └── sawyer_touchx_teleop/
```

## Setup

1. **Add your ROS packages** to `catkin_ws/src/`:
   - Copy your SAWYER packages
   - Copy Geomagic_Touch_ROS_Drivers
   - Copy sawyer_touchx_teleop

2. **Build the Docker image:**
   ```bash
   docker build -t sawyer_noetic:latest .
   ```

## Usage

### Option 1: Using Docker Compose (Recommended)
```bash
docker-compose up -d
docker-compose exec sawyer bash
```

### Option 2: Using the run script
```bash
./run.sh
```

### Option 3: Manual docker run
See the `run.sh` file for the full command with all volume mounts.

## Volumes Mounted

- ROS workspace packages (read/write)
- OpenHaptics SDK (read-only)
- Touch Device Driver (read-only)
- Touch Libraries (read-only)
- X11 socket for GUI applications

## Troubleshooting

### Display Issues
If GUI applications don't appear, run on host:
```bash
xhost +local:root
```

### Touch Device Not Detected
- Ensure the device is plugged in before starting container
- Check that library files are in `~/TouchLibs`
- Verify OpenHaptics is installed in `~/OpenHaptics`

### Permission Issues
The container runs as root with `--privileged` flag to access hardware devices.

## Development

To rebuild the workspace inside the container:
```bash
cd /root/catkin_ws
catkin_make
source devel/setup.bash
```

## Notes

- Container runs with `--net=host` for ROS networking
- X11 forwarding enabled for visualization tools (RViz, etc.)
- All external dependencies must be installed on host machine

# Sawyer_teleop_with_touchx-3D-system
>>>>>>> 588955dd7c53f30fa489b5a92f3532907e23a089
