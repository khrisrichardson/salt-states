# proxychains

## Description:

Proxy chains force any tcp connection made by any given tcp client to follow through proxy (or proxy chain). It is a kind of proxifier. It acts like sockscap / premeo / eborder driver ( intercepts TCP calls )

This version supports SOCKS4, SOCKS5 and HTTP CONNECT proxy servers. Different proxy types can be mixed in the same chain.

Features:

 * Access Internet from behind restrictive firewall.
 * Source IP masquerade.
 * SSH tunneling and forwarding.
 * Dynamic LAN-to-LAN VPN channel.
 * Servers and daemons friendly (works fine with sendmail MTA).

http://proxychains.sourceforge.net

## Depends:

  -  N/A

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── etc
│   └── proxychains.conf
└── init.sls
```
