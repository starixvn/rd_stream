FROM jrottenberg/ffmpeg
COPY bin/ffmpeg.sh /bin/ffmpeg.sh
RUN chmod +x /bin/ffmpeg.sh

ENTRYPOINT ["/bin/ffmpeg.sh"]
