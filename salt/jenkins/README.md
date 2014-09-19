# jenkins

## Description:



## Depends:

  -  [git](salt/git)
  -  [jenkins-common](salt/jenkins-common)
  -  [maven](salt/maven)
  -  [openssh-client.known\_hosts.github.com](salt/openssh-client/known_hosts/github/com)
  -  [oracle-j2sdk1\_7](salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer](salt/oracle-java7-installer)
  -  [ruby-jenkins\_api\_client](salt/ruby-jenkins_api_client)
  -  [sensu-client](salt/sensu-client)
  -  [wget](salt/wget)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](salt/logstash)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-jenkins.json
│   └── systemd
│       └── system
│           └── jenkins.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls

6 directories, 7 files
```
