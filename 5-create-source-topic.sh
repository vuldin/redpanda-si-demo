#!/bin/bash
rpk --profile redpanda-source topic create thelog \
  -c retention.bytes=100000 \
  -c segment.bytes=10000 \
  -c redpanda.remote.read=true \
  -c redpanda.remote.write=true

