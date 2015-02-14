# cobbler-common

## Depends:

  -  N/A

## Reverse Depends:

  -  [cobbler](/salt/cobbler)
  -  [cobbler-web](/salt/cobbler-web)

## Relates:

  -  N/A

## Files:

```bash
.
├── etc
│   └── cobbler
│       └── dhcp.template
├── init.sls
├── map.jinja
└── var
    └── lib
        └── cobbler
            ├── config
            │   └── profiles.d
            │       └── salt.json
            ├── kickstarts
            │   └── salt.ks
            └── snippets
                ├── salt
                ├── security_config
                ├── storage_config
                └── virtual_detect
```
