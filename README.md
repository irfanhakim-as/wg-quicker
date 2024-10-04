# wg-quicker

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat)

## About

`wg-quicker` is a simple wrapper for [WireGuard](https://www.wireguard.com) tools that makes it easier to toggle or switch between multiple WireGuard configurations or profiles right from the terminal.

## Directory

- [wg-quicker](#wg-quicker)
  - [About](#about)
  - [Directory](#directory)
  - [Usage](#usage)
  - [Quickstart](#quickstart)
    - [Dependencies](#dependencies)
    - [Source](#source)
    - [Installation](#installation)
  - [Uninstallation](#uninstallation)

---

## Usage

> [!NOTE]  
> First and foremost, activating and deactivating WireGuard profiles (configurations) requires at least a single WireGuard client configuration (`.conf`) file to be available in the system. Please refer to [this guide](https://github.com/irfanhakim-as/linux-wiki/blob/master/topics/wireguard.md#macos) on how to set that up.

1. Run the command as is to toggle the currently active WireGuard profile:

    ```sh
    wg-quicker
    ```

   - If a profile is active: The profile will be deactivated.
   - If no profile is active: The first profile available on the system will be activated.

2. **Alternatively**, append the name of a profile to the command to activate that profile:

    ```sh
    wg-quicker <profile>
    ```

    As an example, if you wish to activate the `profile-01` profile available on your system:

    ```sh
    wg-quicker profile-01
    ```

   - If a profile is active: The profile will be deactivated, and the specified profile will be activated.
   - If no profile is active: The specified profile will be activated.

3. The script also provides some other helpful options you could utilise.

    Run the command with the `--help` option to see the list of available options:

    ```sh
    wg-quicker --help
    ```

---

## Quickstart

### Dependencies

Install the following packages using [Homebrew](https://brew.sh):

- `wireguard-go`
- `wireguard-tools`

### Source

Before [installing](#installation) the program, we need to first acquire the source of the package if we do not have it already. To do so:

1. Clone the repository to the home directory (i.e. `~/.wg-quicker`):

    ```sh
    git clone https://github.com/irfanhakim-as/wg-quicker.git ~/.wg-quicker
    ```

2. **Alternatively**, download the [latest release](https://github.com/irfanhakim-as/wg-quicker/releases/latest) from the source repository and extract it to the home directory (i.e. `~/.wg-quicker`):

   - Get the latest release version number:

        ```sh
        version=$(curl --silent "https://api.github.com/repos/irfanhakim-as/wg-quicker/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v?([^"]+)".*/\1/')
        ```

        **Alternatively**, you may also specify a version number manually (i.e. `0.1.1`):

        ```sh
        version=0.1.1
        ```

   - Download the version release to the home directory (i.e. `~/.wg-quicker`):

        ```sh
        mkdir -p ~/.wg-quicker && curl -L https://github.com/irfanhakim-as/wg-quicker/releases/download/v${version}/wg-quicker_${version}_any.tar.gz -o ~/.wg-quicker/wg-quicker_${version}_any.tar.gz
        ```

   - Extract the content of the archive:

        ```sh
        tar -xvf ~/.wg-quicker/wg-quicker_${version}_any.tar.gz -C ~/.wg-quicker
        ```

   - Remove the archive:

        ```sh
        rm -f ~/.wg-quicker/wg-quicker_${version}_any.tar.gz
        ```

### Installation

Follow these steps to install or update the program for a single user or system-wide:

1. Ensure that you have all of the required program [dependencies](#dependencies) installed.

2. Get into the [source](#source) directory (i.e. `~/.wg-quicker`):

    ```sh
    cd ~/.wg-quicker
    ```

3. Install using the provided installer script:

   - To install the program for a single user, simply run the script as is:

        ```sh
        ./install.sh
        ```

        By default, this will install the program to the `~/.local` prefix. Please ensure that the `~/.local/bin` directory is in your `PATH` environment variable.

   - **Alternatively**, to install the program system-wide, run the script with `sudo`:

        ```sh
        sudo ./install.sh
        ```

---

## Uninstallation

Follow these steps to uninstall the program:

1. Get into the [source](#source) directory you had downloaded during the initial installation (i.e. `~/.wg-quicker`):

    ```sh
    cd ~/.wg-quicker
    ```

2. Uninstall using the provided uninstaller script:

   - If you have previously installed the program for a single user, simply run the script as is:

        ```sh
        ./uninstall.sh
        ```

   - **Alternatively**, if you have installed the program system-wide, run the script with `sudo`:

        ```sh
        sudo ./uninstall.sh
        ```
