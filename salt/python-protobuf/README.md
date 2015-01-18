# python-protobuf

## Description:

Protocol buffers are a flexible, efficient, automated mechanism for serializing structured data - similar to XML, but smaller, faster, and simpler. You define how you want your data to be structured once, then you can use special generated source code to easily write and read your structured data to and from a variety of data streams and using a variety of languages. You can even update your data structure without breaking deployed programs that are compiled against the "old" format.

Google uses Protocol Buffers for almost all of its internal RPC protocols and file formats.

This package contains the Python bindings for the protocol buffers. You will need the protoc tool (in the protobuf-compiler package) to compile your definition to Python classes, and then the modules in this package will allow you to use those classes in your programs.

## Depends:

  -  N/A

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── init.sls
└── map.jinja
```
