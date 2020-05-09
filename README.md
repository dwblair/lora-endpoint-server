
# lora endpoint server 

(This has been tested on Ubuntu 18.04)
 
## Installation

### Install nodejs and npm, via nvm

This server is based on NodeJS. It's a good idea to use nvm for NodeJS applications, as it allows you to manage multiple versions easily, and also allows for easy un-install if things go awry.

You can download and install [nvm (node version manager)](https://github.com/nvm-sh/nvm) with a single line:

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

You may then need to open a new terminal window in order for the 'nvm' command to be available.  


Now use nvm to install node version 11:

```
nvm install 11
nvm use 11
```

(last line may be redundant.


### Install sqlite3

Sqlite is the database we'll be using to store our data.

To install it, you can use the included script, found inside this repository's 'utilities' folder:

```
./sqlite3_install.sh
```

or carry out that script's installation procedure manually:

```
sudo apt-get install libsqlite3-dev
npm install sqlite3 --build-from-source --sqlite=/usr
npm install
```

## Install our prototype endpoint-server

Now we're ready to install the endpoint-server itself. At the top level in this repository, enter the command:

```
npm install
```

## Usage

To run the server, at the top level of this repository, type:

```	
node endpoint_server.js
```


