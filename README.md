
# Redpanda Tiered Storage and Remote Read Replicas

Tiered Storage is a Redpanda Enterpise feature that allows for low-cost infinite data retention by moving
log data to an archive while retaining the ability to serve it back to clients. It uses an object store
for the archive and communicates via the S3 protocol.

Remote Read Replica is a feature built on top of tiered storage that allows another Redpanda cluster to serve topics
(in read-only mode) that have been archived to S3. It allows for the dynamic provisioning of read-only topics for
analytical workloads.

This demo uses Docker Compose. It sets up two single-node Redpanda clusters, with one as the source and the other
to serve Remote Read Replicas.
Each cluster has an attached Redpanda Console instance. [MinIO](http://min.io) is used as the object store.

![Docker Compose Setup](./setup.png)

## Related Material

For more information on Tiered Storage and Remote Read Replicas, you can consult the following links.
* [Shadow Indexing Deep Dive](https://redpanda.com/blog/tiered-storage-architecture-shadow-indexing-deep-dive/)
* [Remote Read Replicas](https://redpanda.com/blog/remote-read-replicas-for-distributing-work)
* [Documentation](https://docs.redpanda.com/docs/data-management/)

## Pre-requisites

This demo uses [MinIO](https://min.io/) for local S3-compatible object storage.
To go through this demo, you will need:

* Docker
* `rpk` - Redpanda CLI
* `mc` - MinIO Console
* `tree` - Optional, for hierarchical directory listing

### Installing Pre-requisites

First, make sure you have [Docker Compose](https://docs.docker.com/compose/install/) installed.
Then you can follow these OS specific instructions to install the rest.

#### MacOS

```bash
brew install redpanda-data/tap/redpanda
brew install minio/stable/mc
brew install tree
```

#### Ubuntu

```bash
mkdir ~/bin 2> /dev/null; cd ~/bin
curl -LO https://github.com/redpanda-data/redpanda/releases/download/v21.11.15/rpk-linux-amd64.zip
unzip rpk-linux-amd64.zip && rm rpk-linux-amd64.zip
curl -O https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x mc
sudo apt install tree -y
```

Add the following to `~/.bashrc` or `~/.zshrc` if needed:

```bash
export PATH=$PATH:$HOME/bin
```

### Get the code

```bash
git clone https://github.com/vuldin/redpanda-si-demo.git
cd redpanda-si-demo
```

### Run the demo

You will see the following executable scripts:

```
> ls *sh
0-reset.sh  1-start-minio.sh  2-setup-minio.sh  3-start-redpanda.sh  4-create-rpk-profiles.sh  5-create-source-topic.sh  6-create-rrr-topic.sh  7-produce.sh  8-consume.sh  9-delete-source-topic.sh
```

Run through these in order to:
0. reset permissions, delete old data, clean up previously-created rpk profiles, etc.
1. start minio
2. setup the source and target buckets
4. create rpk profiles
5. create the source topic
6. create the RRR (target) topic
7. produce data into source topic
8. consume data from target topic
9. (optional) delete source topic (You can then verify data can still be read from the target topic)

Once complete you may want to run `./0-reset.sh` again.

