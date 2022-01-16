FROM fimbaz/go-algorand-datanet101:latest
RUN apt-get install -y inotify-tools curl emacs-nox
RUN mkdir -p /opt/datanet101/
WORKDIR /opt/datanet101/
ENV ALGORAND_DATA=/opt/datanet101/
COPY config.json .
COPY consensus.json .
COPY genesis.json .
COPY datanet101.bash .
EXPOSE 35334/tcp
EXPOSE 35335/tcp
ARG CATCHPOINT=""
ENTRYPOINT ["./datanet101.bash"]