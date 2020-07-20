BYTN Core 0.14.0
=====================

This is the official reference wallet for BYTN digital currency and comprises the backbone of the BYTN peer-to-peer network. You can [download BYTN Core](https://www.bytn.org/downloads/) or [build it yourself](#building) using the guides below.

Running
---------------------
The following are some helpful notes on how to run BYTN on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/bytn-qt` (GUI) or
- `bin/bytnd` (headless)

### Windows

Unpack the files into a directory, and then run bytn-qt.exe.

### OS X

Drag BYTN-Qt to your applications folder, and then run BYTN-Qt.

### Need Help?

* See the [BYTN documentation](https://docs.bytn.org)
for help and more information.
* See the [BYTN Developer Documentation](https://bytn-docs.github.io/) 
for technical specifications and implementation details.
* Ask for help on [BYTN Nation Discord](http://bytnchat.org)
* Ask for help on the [BYTN Forum](https://bytn.org/forum)

Building
---------------------
The following are developer notes on how to build BYTN Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [OS X Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [Gitian Building Guide](gitian-building.md)

Development
---------------------
The BYTN Core repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- Source Code Documentation ***TODO***
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [Travis CI](travis-ci.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [BYTN Forum](https://bytn.org/forum), in the Development & Technical Discussion board.
* Discuss on [BYTN Nation Discord](http://bytnchat.org)

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [Files](files.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
