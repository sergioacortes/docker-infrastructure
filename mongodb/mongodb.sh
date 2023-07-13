#!/bin/bash

echo "Setting up MongoDb as replica set..."
mongo <<EOF
var cfg = {
    "_id": "rs-local",
    "protocolVersion": 1,
    "version": 1,
    "members": [
        {
            "_id": 0,
            "host": "localhost:${MONGO_PORT}",
            "priority": 1
        }
    ]
};
rs.initiate(cfg, { force: true });
rs.status();
EOF

echo "MongoDb replica set setup complete!"