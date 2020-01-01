FROM python:3.6-alpine

ENV PLEX_SECTION=Anime \
    PLEX_URL=localhost \
    PLEX_TOKEN='' \
    PLEX_SYNC='False' \
    PLEX_SYNC_USERNAME='' \
    PLEX_SYNC_URL='' \
    ANI_USERNAME='' \
    ANI_TOKEN='' \
    ANI_PLEXCOUNT_PRIORITY='False' \
    ANI_SKIP_LISTUPDATE='False'

ENV PATH=".:${PATH}:~/.local/bin"

RUN apk add --no-cache bash

WORKDIR /plexanisync

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY *.py ./
COPY runsync.sh ./

RUN chmod +x runsync.sh

ENTRYPOINT ["runsync.sh"]
