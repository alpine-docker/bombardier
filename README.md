# alpine/bombardier

[If enjoy, please consider buying me a coffee.](https://www.buymeacoffee.com/ozbillwang)

Auto trigger with latest release and build a docker image with the [bombardier](https://github.com/codesenberg/bombardier) ready to run.

### updates

* Support for multiple architectures
* Support for multi-stage builds

![image](https://github.com/alpine-docker/bombardier/assets/8954908/269a548a-9426-460f-b610-bde71b5a577f)


### Repo:

https://github.com/alpine-docker/bombardier

### Daily build logs:

https://app.circleci.com/pipelines/github/alpine-docker/bombardier

### Docker iamge tags:

https://hub.docker.com/r/alpine/bombardier/tags/

### Running

```
$ docker run --rm -it alpine/bombardier --help

#  need wait for minutes to get output
$ docker run -ti --rm alpine/bombardier -c 200 -d 10s -l http://www.google.com
Bombarding http://www.google.com for 10s using 200 connections
[============================================================================================================] 10s
Done!
Statistics        Avg      Stdev        Max
  Reqs/sec       317.90     139.54     811.33
  Latency      614.37ms   147.09ms      1.81s
  Latency Distribution
     50%   613.75ms
     75%   639.65ms
     90%   707.76ms
     99%      1.20s
  HTTP codes:
    1xx - 0, 2xx - 0, 3xx - 3359, 4xx - 0, 5xx - 0
    others - 0
  Throughput:   256.01KB/s
```

### The Processes to build this image

The Processes to build this image
* Enable CI cronjob on this repo to run build daily on master branch
* Check if there are new tags/releases announced via Github REST API
* Match the exist docker image tags via Hub.docker.io REST API
* If not matched, build the image with latest version as tag and push to hub.docker.com
