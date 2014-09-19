# sysstat

## Description:

The sysstat package contains the following system performance tools:
- sar: collects and reports system activity information;
- iostat: reports CPU utilization and disk I/O statistics;
- mpstat: reports global and per-processor statistics;
- pidstat: reports statistics for Linux tasks (processes);
- sadf: displays data collected by sar in various formats;
- nfsiostat: reports I/O statistics for network filesystems;
- cifsiostat: reports I/O statistics for CIFS filesystems.
The statistics reported by sar deal with I/O transfer rates, paging activity, process-related activities, interrupts, network activity, memory and swap space utilization, CPU utilization, kernel activities and TTY statistics, among others. Both UP and SMP machines are fully supported.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [sensu](/salt/sensu)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-sysstat.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 3 files
```
