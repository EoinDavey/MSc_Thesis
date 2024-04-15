FROM texlive/texlive

RUN fc-cache

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

WORKDIR /workdir

ENTRYPOINT ["/tmp/entrypoint.sh"]
