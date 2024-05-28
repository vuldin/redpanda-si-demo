#!/bin/bash
rpk profile create redpanda-source -s brokers=localhost:9092
rpk profile create redpanda-target -s brokers=localhost:9192

