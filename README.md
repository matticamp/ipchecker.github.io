# ipchecker.github.io
Bash script to automate the research for malicious IP addresses, originally created for OS X El Capitan.


A Linux version, called ipchecker_linux.bash is also included in this package.

I also created a version for use with Windows Susbsystem for Linux under Windows 10.

In order to use the script, you'll be prompted for an IP address to check.

The script will perform a recon on the IP by populating a list of specialized websites 
with the IP address entered by the user.

The script will validate the IP address entered by using regular expressions and 
it will perform a recon on the entered IP only if it's a valid public IP address.

Invalid IP addresses and private IP addresses will generate an error and no recon will be performed.

This is my first commit ever, hope you'll enjoy it!!

The_S@vvygeek.
