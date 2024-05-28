#!/bin/bash
docker compose -f compose.minio.yaml -f compose.redpanda-source.yaml -f compose.redpanda-target.yaml down
rpk profile delete redpanda-source
rpk profile delete redpanda-target
sudo rm -r minio-data/* 2> /dev/null
sudo chown -R $(whoami):$(whoami) redpanda-data
sudo rm -r redpanda-data/redpanda-source/* 2> /dev/null
sudo rm -r redpanda-data/redpanda-target/* 2> /dev/null
sudo chown -R 101:101 {redpanda-data,redpanda-config}

