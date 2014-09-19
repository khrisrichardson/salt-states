# tasseo

## Description:



## Depends:

  -  [apache2](/salt/apache2)
  -  [git](/salt/git)
  -  [ruby-rvm](/salt/ruby-rvm)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-apache2.sls
├── depend-git.sls
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-tasseo.json
│   └── systemd
│       └── system
│           └── tasseo.service
├── init.sls
├── opt
│   └── tasseo
│       ├── dashboards
│       │   └── node.js
│       └── lib
│           └── tasseo
│               └── public
│                   └── c
│                       └── style.css
└── relate-sensu-api.sls

13 directories, 10 files
```
