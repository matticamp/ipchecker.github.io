# ipchecker.github.io
Bash script designed to automate the research for malicious IP addresses, originally created for OS X El Capitan and now available for macOS.


A Linux version, called ipchecker_linux.bash, is included in this package, too.

I also created a version for use with Windows Subsystem for Linux under Windows 10 (ipchecker_win10wsl.bash).

In order to use the script, you'll be prompted for an IP address to check.

The script will perform a recon on the IP by populating a list of specialized websites 
with the IP address entered by the user.

The script will validate the IP address entered by using regular expressions and 
it will perform a recon only if a valid public IP address is provided.

Invalid IP addresses and private IP addresses will generate an error and no recon will be performed.

This is my first commit ever, hope you'll enjoy it!!

The_S@vvygeek.
