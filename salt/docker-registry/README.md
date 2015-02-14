# docker-registry

## Depends:

  -  [git](/salt/git)
  -  [postfix](/salt/postfix)

## Reverse Depends:

  -  N/A

## Relates:

  -  [glance-api](/salt/glance-api)
  -  [keystone](/salt/keystone)
  -  [redis-server](/salt/redis-server)
  -  [swift-proxy](/salt/swift-proxy)

## Files:

```bash
.
├── defaults.yaml
├── depend-aws-s3.sls
├── depend-git.sls
├── init.sls
├── opt
│   └── docker
│       └── registry
│           └── config.yml
├── relate-glance-api.sls
├── relate-keystone.sls
├── relate-redis-server.sls
└── relate-swift-proxy.sls
```
