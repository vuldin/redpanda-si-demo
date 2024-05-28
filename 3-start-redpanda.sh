#!/bin/bash
docker compose -f compose.redpanda-source.yaml -f compose.redpanda-target.yaml up -d

