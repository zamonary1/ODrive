Building the ODrive firmware

## Requirements for buildind the firmware

- Any modern linux distribution
- Windows/macOS (untested)
- Podman
- Git

## Instructions
First, clone and open the ODrive repository:

```bash
git clone https://github.com/zamonary1/ODrive.git
cd ODrive
```

Ensure that podman is installed and running:

```bash
podman -v
```

If not, install podman:

```bash
# debian\ubuntu
sudo apt-get install podman
# fedora
sudo dnf install podman
# arch
sudo pacman -S podman
# alpine
sudo apk add podman
# macos
brew install podman
```


### Linux and MacOS

Use the automated script for building using podman

```bash
./dockerbuild.sh
```

Then if everything is succesfull, you can find the binaries in
```
./Firmware/build
```

### Windows (untested)

Use podman to manually build the firmware:

###### delete the old build container
```bash
podman rm odrive-build-cont
```

```bash
podman build -t odrive-build-image .
podman run -it -v %cd%:/odrive --name odrive-build-cont odrive-build-image:latest
```
