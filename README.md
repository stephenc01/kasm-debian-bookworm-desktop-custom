# Debian Bookworm Desktop Dockerfile

This Dockerfile is based on the `kasmweb/debian-bookworm-desktop:1.14.0` image.

## Configuration

- **User**: `root`
- **Environment Variables**:
  - `HOME`: `/home/kasm-default-profile`
  - `STARTUPDIR`: `/dockerstartup`
  - `INST_SCRIPTS`: `$STARTUPDIR/install`
- **Working Directory**: `$HOME`

## Customizations

### Removing Desktop Icons

The following applications are removed to clean up the desktop icons:
- Signal Desktop
- Thunderbird
- OBS
- VLC

```bash
RUN apt-get --purge remove signal-desktop -y \
    && apt-get --purge remove thunderbird -y \
    && apt-get --purge remove obs-* -y \
    && apt-get --purge remove vlc* -y
```

## Installing PowerShell

PowerShell version 7.3.7 is installed using the provided `.deb` package.

```bash
RUN wget -q https://github.com/PowerShell/PowerShell/releases/download/v7.3.7/powershell_7.3.7-1.deb_amd64.deb \
    && dpkg -i powershell_7.3.7-1.deb_amd64.deb \
    && apt-get install -f \
    && rm powershell_7.3.7-1.deb_amd64.deb
```
