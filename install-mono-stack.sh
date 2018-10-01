#!/bin/bash

# For Ubuntu 16.04 only.
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/mono-official.list
sudo apt-get update -y

# Install mono runtime, compiler, mono's local web server, nuget and GTK3 binding to be used with MonoDevelop 6.0.
sudo apt install mono-devel mono-xsp libgtk3.0-cil nuget

# Install MonoDevelop from third party maintainer (easy installation).
wget https://github.com/cra0zy/monodevelop-run-installer/releases/download/6.2.0.1515-1/monodevelop-6.2.0.1515-1.run && chmod +x monodevelop-6.2.0.1515-1.run && sudo ./monodevelop-6.2.0.1515-1.run
