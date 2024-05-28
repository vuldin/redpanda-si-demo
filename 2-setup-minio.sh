#!/bin/bash
mc alias set local http://localhost:9000 minio minio123
mc mb local/redpanda-source
mc mb local/redpanda-target

