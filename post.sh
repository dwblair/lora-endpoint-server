#!/bin/bash

curl -H 'Content-Type: application/json' -d '{"temperature":"23.2", "humidity":"10.0", "pressure":"1331"}' -X POST http://localhost:8000/api/simplepost


