% sicherboot(8) Sicherboot User Manuals
% Julian Andres Klode
% September 6, 2016

# NAME

sicherboot - systemd-boot integration with UEFI secure boot support

# SYNOPSIS

sicherboot [command] [arg...]

# DESCRIPTION

sicherboot manages the systemd-boot bootloader and kernels in an EFI
System Partition (ESP). It stores a set of keys in `/etc/sicherboot/keys`
to sign the binaries for use with secure boot.

# INITIAL SETUP

After installation of sicherboot, setup `/etc/kernel/cmdline` and perhaps
change some options in `/etc/sicherboot/sicherboot.conf` to your liking.

Once you have configured sicherboot as you want, run `sicherboot setup`
to perform the initial installation.

sicherboot setup
:   Performs the initial installation of sicherboot to the ESP.

    This basically runs `enroll-keys`, `install-kernel`, `bootctl install`,
    asking before each step.

# KEY MANAGEMENT

sicherboot generate-keys
:   Generates keys in the directory configured in the `KEY_HOME` option.

sicherboot enroll-keys
:   Copies the public keys into the ESP, first running `generate-keys` if no
    keys exist yet.

# KERNEL MANAGEMENT

sicherboot install-kernel [*VERSION*]
:   Install the specified kernel version to the ESP, with initramfs and signed

sicherboot remove-kernel [*VERSION*]
:   Remove the specified kernel version from the ESP

# OTHER TOOLS

sicherboot bootctl [*ARGUMENT*...]
: Run the `bootctl` program with the specified arguments, and sign the
  bootloader afterwards.

sicherboot sign-image *EXECUTABLE*
: Sign the given executable using the `db` key.

# FILES

`/etc/sicherboot/sicherboot.conf`
: The sicherboot configuration file

`/etc/sicherboot/keys`
: The default key storage location
