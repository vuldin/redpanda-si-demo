#!/bin/bash
BATCH=$(date) ; printf "$BATCH %s\n" {1..1000000} | rpk --profile redpanda-source topic produce thelog

