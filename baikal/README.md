# [WIP] Baikal Docker Image

## Issues

* Baikal checks paths based on symlink location but getcwd returns the resolved
  location (At least it does in uWSGI)
