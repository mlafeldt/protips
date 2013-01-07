# Rescue Your GitHub Downloads

As [GitHub has recently deprecated Downloads](https://github.com/blog/1302-goodbye-uploads), you might want to save all the files you've manually uploaded to your repositories, e.g. to upload them to a different place.

This command will list all download URLs for a repository:

	$ wget -O- -q https://api.github.com/repos/:owner/:repo/downloads | grep html_url | cut -d\" -f4

For example, here are the downloads of my [PS2rd](http://mlafeldt.github.com/ps2rd) project:

	$ wget -O- -q https://api.github.com/repos/mlafeldt/ps2rd/downloads | grep html_url | cut -d\" -f4
	https://github.com/downloads/mlafeldt/ps2rd/ps2rd-0.5.3.sha1
	https://github.com/downloads/mlafeldt/ps2rd/ps2rd-0.5.3.zip
	https://github.com/downloads/mlafeldt/ps2rd/ps2rd-0.5.3.tar.bz2

To directly download all files, simply add another command to the chain:

	$ wget -O- -q https://api.github.com/repos/:owner/:repo/downloads | grep html_url | cut -d\" -f4 | wget -i-

(Note that the shown commands depend on GitHub's [Downloads API](http://developer.github.com/v3/repos/downloads/), which will be disabled soon. So hurry up!)
