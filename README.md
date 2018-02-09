# sloth

It waits.

This is a web service with two endpoints. Both accept the connection immediately. One waits a specified time, then responds. The other responds immediately and streams _n_ further responses, _x_ms apart.

## Examples

```
$ time curl http://sloth.service.consul:3000/sleepy/wait/1000.txt
I waited for 1.0 seconds, then rendered.
curl http://sloth.service.consul:32769/sleepy/wait/1000.txt  0.01s user 0.01s system 1% cpu 1.097 total

$ time curl http://sloth.service.consul:3000/sleepy/stream/1000/7.txt
Waiting for 1.0 seconds, 7 times...
Slept 1
Slept 2
Slept 3
Slept 4
Slept 5
Slept 6
Slept 7
Done
curl http://sloth.service.consul:32769/sleepy/stream/1000/7.txt  0.01s user 0.01s system 0% cpu 7.108 total
```

## Deploying

On a docker engine...

```
$ docker build -t sloth .
$ docker run -d -p 3000:3000 sloth
```

You'll find `sloth` on the port you mapped (`3000`).
