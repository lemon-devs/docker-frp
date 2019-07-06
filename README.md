## Build
```
docker build -t frp:20190706 .
```

## Server
```
docker run -it --name frps-srv-ssh -v /path/to/frps.ini:/etc/frp/frps.ini -d frp:2019706
```
