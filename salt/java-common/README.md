# java-common

## Description:

This package must be installed in the system if a Java environment is desired. It covers useful information for Java users in Debian GNU/Linux, including:
* The Java policy document which describes the layout of Java support in
  Debian and how Java packages should behave.
* The Debian-Java-FAQ which provides information on the status of
  Java support in Debian, available compilers, virtual machines, Java
  programs and libraries as well as on legal issues.
* Information on how to create dummy packages to fulfill java2
  requirements.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [oracle-j2sdk1\_6](/salt/oracle-j2sdk1_6)
  -  [oracle-j2sdk1\_7](/salt/oracle-j2sdk1_7)
  -  [oracle-java6-installer](/salt/oracle-java6-installer)
  -  [oracle-java7-installer](/salt/oracle-java7-installer)
  -  [oracle-java8-installer](/salt/oracle-java8-installer)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── alternatives.sls
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-java-common.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 4 files
```
