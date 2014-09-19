# build-essential

## Description:

If you do not plan to build Debian packages, you don't need this package.  Starting with dpkg (>= 1.14.18) this package is required for building Debian packages.

This package contains an informational list of packages which are considered essential for building Debian packages.  This package also depends on the packages on that list, to make it easy to have the build-essential packages installed.

If you have this package installed, you only need to install whatever a package specifies as its build-time dependencies to build the package.  Conversely, if you are determining what your package needs to build-depend on, you can always leave out the packages this package depends on.

This package is NOT the definition of what packages are build-essential; the real definition is in the Debian Policy Manual. This package contains merely an informational list, which is all most people need.   However, if this package and the manual disagree, the manual is correct.

## Depends:

  -  N/A

## Reverse Depends:

  -  [gitlab] (salt/gitlab)

## Relates:

  -  N/A

## Files:

```bash
.
└── init.sls

0 directories, 1 file
```
