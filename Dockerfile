FROM algorand-datanet101:latest
ENV ALGORAND_DATA=/root/.algorand/
COPY config.json /root/.algorand/
COPY consensus.json /root/.algorand/
COPY entrypoint.bash ./
EXPOSE 35334/tcp
EXPOSE 35335/tcp
RUN apt-get install -y inotify-tools curl emacs-nox
ARG CATCHPOINT=""
ENTRYPOINT ["./entrypoint.bash"]