# aurora-scheduler

## Depends:

  -  [aurora](/salt/aurora)
  -  [aurora.depend-git](/salt/aurora\/depend-git)
  -  [build-essential](/salt/build-essential)
  -  [default-jdk](/salt/default-jdk)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)
  -  [unzip](/salt/unzip)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-git.sls
├── depend-supervisor.sls
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-aurora.json
│   └── supervisor
│       └── conf.d
│           └── aurora.conf
├── init.sls
├── relate-sensu-api.sls
└── usr
    └── local
        └── aurora-scheduler
            └── bin
                └── schedule.sh
```
