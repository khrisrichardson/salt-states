# ntpdate

## Description:

NTP, the Network Time Protocol, is used to keep computer clocks accurate by synchronizing them over the Internet or a local network, or by following an accurate hardware receiver that interprets GPS, DCF-77, NIST or similar time signals.

ntpdate is a simple NTP client that sets a system's clock to match the time obtained by communicating with one or more NTP servers.  It is not sufficient, however, for maintaining an accurate clock in the long run.  ntpdate by itself is useful for occasionally setting the time on machines that do not have full-time network access, such as laptops.

If the full NTP daemon from the package "ntp" is installed, then ntpdate is not necessary.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-ntpdate.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 3 files
```
