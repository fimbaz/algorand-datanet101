FROM algorand-datanet101:latest
ENV ALGORAND_DATA=/root/.algorand/
COPY config.json /root/.algorand/
COPY consensus.json /root/.algorand/
COPY entrypoint.bash ./
EXPOSE 35334/tcp
EXPOSE 35335/tcp
CMD apt install inotify-tools emacs-nox
ARG CATCHPOINT=""
ENTRYPOINT ["./entrypoint.bash"]