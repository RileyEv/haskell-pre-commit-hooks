FROM haskell:8.10 as builder
RUN cabal update

FROM builder as hlint-installer

RUN cabal install hlint
# hadolint ignore=DL3059
RUN /bin/bash -c "cp $(readlink -f /root/.cabal/bin/hlint) /bin/hlint"

FROM builder as stylish-haskell-installer

RUN cabal install stylish-haskell
# hadolint ignore=DL3059
RUN /bin/bash -c "cp $(readlink -f /root/.cabal/bin/stylish-haskell) /bin/stylish-haskell"


FROM haskell:8.10 as hlint
COPY --from=hlint-installer /bin/hlint /bin/hlint
ENTRYPOINT ["/bin/hlint"]


FROM haskell:8.10 as stylish-haskell
COPY --from=stylish-haskell-installer /bin/stylish-haskell /bin/stylish-haskell
ENTRYPOINT ["/bin/stylish-haskell"]
