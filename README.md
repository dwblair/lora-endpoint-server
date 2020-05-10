
# lora endpoint server 

 
## Overview

LoRa gateways and associated online services typically allow the user to define an optional 'HTTP endpoint' or 'HTTP Integration' URL:  once this URL is defined, sensor data that arrives at the gateway or online service will be relayed via an HTTP POST of the sensor data (in JSON format) to that URL.   This URL must therefore be the address of a server of some sort that is capable of receiving JSON data via HTTP POST and e.g. storing it in a database, graphing it, etc. 

Below is a minimal example of such an'HTTP endpoint' server.  The server (here called 'endpoint_server.js' is based on NodeJS, and it stores and retrieves data to / from an 'sqlite' database -- a particularly straightforward and lightweight database technology that stores its data in a single file (here called 'db.sqlite').

After installing the necessary prequisites, one can then run the server via the command line from the repository directory by typing:

```
node endpoint_server.js
```

The result is that there will now be a server running at the host machine's IP address, at port 8000, which is listening for HTTP POST requests at the following URL:

```
[YOUR_IP_ADDRES]:8000/api/endpoint
```

Incoming POST requests to that URL, if properly formatted,  will be stored it in the sqlite database.  

In our server, we are expecting a particularly simple JSON structure:

```
{"temperature":"23.2", "humidity":"10.0", "pressure":"1331"}
```

The server is expecting a JSON packet in the above form -- the values (23.2,10.0, etc) can vary, but the keys (temperature, humidity, etc) cannot. 

> Note: we provide a helper script, detailed below, that will POST example JSON data to the server in the proper format.

Any data that is successfully recieved and stored in the database can then later be retrieved by visiting:

```
[YOUR_IP_ADDRES]:8000/api/latest
```

 -- which will provide the data in the browser in JSON format. 

Stored data can also be visualized in a basic graph by visiting:

```
[YOUR_IP_ADDRES]:8000
```

>More details / functionality detailed below.

(Tested on Ubuntu 18.04)

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

