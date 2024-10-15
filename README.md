## Convert the video to hls format

1. Build the docker image

```bash
docker build -t converter . -f ffmpeg.Dockerfile
```

3. Copy your videos into `input` directory

4. Convert

```bash
docker run -v "$(PWD)/input:/input" -v "$(PWD)/output:/output" --rm converter /input /output
```
