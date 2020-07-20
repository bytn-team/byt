Sample init scripts and service configuration for bytnd
==========================================================

Sample scripts and configuration files for systemd, Upstart and OpenRC
can be found in the contrib/init folder.

    contrib/init/bytnd.service:    systemd service unit configuration
    contrib/init/bytnd.openrc:     OpenRC compatible SysV style init script
    contrib/init/bytnd.openrcconf: OpenRC conf.d file
    contrib/init/bytnd.conf:       Upstart service configuration file
    contrib/init/bytnd.init:       CentOS compatible SysV style init script

1. Service User
---------------------------------

All three Linux startup configurations assume the existence of a "bytncore" user
and group.  They must be created before attempting to use these scripts.
The OS X configuration assumes bytnd will be set up for the current user.

2. Configuration
---------------------------------

At a bare minimum, bytnd requires that the rpcpassword setting be set
when running as a daemon.  If the configuration file does not exist or this
setting is not set, bytnd will shutdown promptly after startup.

This password does not have to be remembered or typed as it is mostly used
as a fixed token that bytnd and client programs read from the configuration
file, however it is recommended that a strong and secure password be used
as this password is security critical to securing the wallet should the
wallet be enabled.

If bytnd is run with the "-server" flag (set by default), and no rpcpassword is set,
it will use a special cookie file for authentication. The cookie is generated with random
content when the daemon starts, and deleted when it exits. Read access to this file
controls who can access it through RPC.

By default the cookie is stored in the data directory, but it's location can be overridden
with the option '-rpccookiefile'.

This allows for running bytnd without having to do any manual configuration.

`conf`, `pid`, and `wallet` accept relative paths which are interpreted as
relative to the data directory. `wallet` *only* supports relative paths.

For an example configuration file that describes the configuration settings,
see `contrib/debian/examples/bytn.conf`.

3. Paths
---------------------------------

3a) Linux

All three configurations assume several paths that might need to be adjusted.

Binary:              `/usr/bin/bytnd`  
Configuration file:  `/etc/bytncore/bytn.conf`  
Data directory:      `/var/lib/bytnd`  
PID file:            `/var/run/bytnd/bytnd.pid` (OpenRC and Upstart) or `/var/lib/bytnd/bytnd.pid` (systemd)  
Lock file:           `/var/lock/subsys/bytnd` (CentOS)  

The configuration file, PID directory (if applicable) and data directory
should all be owned by the bytncore user and group.  It is advised for security
reasons to make the configuration file and data directory only readable by the
bytncore user and group.  Access to bytn-cli and other bytnd rpc clients
can then be controlled by group membership.

3b) Mac OS X

Binary:              `/usr/local/bin/bytnd`  
Configuration file:  `~/Library/Application Support/BYTNCore/bytn.conf`  
Data directory:      `~/Library/Application Support/BYTNCore`
Lock file:           `~/Library/Application Support/BYTNCore/.lock`

4. Installing Service Configuration
-----------------------------------

4a) systemd

Installing this .service file consists of just copying it to
/usr/lib/systemd/system directory, followed by the command
`systemctl daemon-reload` in order to update running systemd configuration.

To test, run `systemctl start bytnd` and to enable for system startup run
`systemctl enable bytnd`

4b) OpenRC

Rename bytnd.openrc to bytnd and drop it in /etc/init.d.  Double
check ownership and permissions and make it executable.  Test it with
`/etc/init.d/bytnd start` and configure it to run on startup with
`rc-update add bytnd`

4c) Upstart (for Debian/Ubuntu based distributions)

Drop bytnd.conf in /etc/init.  Test by running `service bytnd start`
it will automatically start on reboot.

NOTE: This script is incompatible with CentOS 5 and Amazon Linux 2014 as they
use old versions of Upstart and do not supply the start-stop-daemon utility.

4d) CentOS

Copy bytnd.init to /etc/init.d/bytnd. Test by running `service bytnd start`.

Using this script, you can adjust the path and flags to the bytnd program by
setting the BYTND and FLAGS environment variables in the file
/etc/sysconfig/bytnd. You can also use the DAEMONOPTS environment variable here.

4e) Mac OS X

Copy org.bytn.bytnd.plist into ~/Library/LaunchAgents. Load the launch agent by
running `launchctl load ~/Library/LaunchAgents/org.bytn.bytnd.plist`.

This Launch Agent will cause bytnd to start whenever the user logs in.

NOTE: This approach is intended for those wanting to run bytnd as the current user.
You will need to modify org.bytn.bytnd.plist if you intend to use it as a
Launch Daemon with a dedicated bytncore user.

5. Auto-respawn
-----------------------------------

Auto respawning is currently only configured for Upstart and systemd.
Reasonable defaults have been chosen but YMMV.
