FROM haskell:8.10 as hlint

RUN cabal update && cabal install hlint
ENTRYPOINT ["hlint"]

FROM haskell:8.10 as stylish-haskell

RUN cabal update && cabal install stylish-haskell
ENTRYPOINT ["stylish-haskell"]
