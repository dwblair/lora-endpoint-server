
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

You will see a message similar to the following:

```
server running at [YOUR_IP_ADDRESS]:8000
Connected to the SQlite database.
found table 'data'
```

### Getting the latest data

The most recent entries in the database can be retrieved (in JSON format) via your browser at: 

```
[YOUR_IP_ADDRESS]:8000/api/data/latest
```

### Visualizing graphs of the data

Graphs (experimental) may be found at:

```
[YOUR_IP_ADDRESS]:8000
```

### Sending new data to the endpoint server (simulating a LoRa gateway)

The server is set up to receive JSON-formatted data via an HTTP POST.  You can test out this functionality by using the included convenience function, 'post.sh', located in the 'gateway_simulator' folder.  This function requires as a command line argument the IP address and port of the running server. 

While the server is running in a terminal, open another terminal, and try a test data post:

```
./post.sh [YOUR_IP_ADDRESS]:8000
```

Every time that this script is run, it should add another entry to the database.

