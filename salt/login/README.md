# login

## Description:

These tools are required to be able to login and use your system. The login program invokes your user shell and enables command execution. The newgrp program is used to change your effective group ID (useful for workgroup type situations). The su program allows changing your effective user ID (useful being able to execute commands as another user).

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
│   └── pam.d
│       └── login
└── init.sls
```
