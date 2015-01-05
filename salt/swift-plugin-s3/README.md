# swift-plugin-s3

## Description:

OpenStack Object Storage (code-named Swift) creates redundant, scalable object storage using clusters of standardized servers to store petabytes of accessible data. It is not a file system or real-time data storage system, but rather a long-term storage system for a more permanent type of static data that can be retrieved, leveraged, and then updated if necessary. Primary examples of data that best fit this type of storage model are virtual machine images, photo storage, email storage and backup archiving. Having no central "brain" or master point of control provides greater scalability, redundancy and permanence.

Objects are written to multiple hardware devices in the data center, with the OpenStack software responsible for ensuring data replication and integrity across the cluster. Storage clusters can scale horizontally by adding new nodes. Should a node fail, OpenStack works to replicate its content from other active nodes. Because OpenStack uses software logic to ensure data replication and distribution across different devices, inexpensive commodity hard drives and servers can be used in lieu of more expensive equipment.

This package provides the Swift3 Middleware plugin for OpenStack Swift, allowing access to OpenStack swift via the Amazon S3 API.

## Depends:

  -  N/A

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
└── init.sls
```
