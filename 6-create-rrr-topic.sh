#!/bin/bash
rpk --profile redpanda-target topic create thelog \
  -c redpanda.remote.readreplica=redpanda-source

