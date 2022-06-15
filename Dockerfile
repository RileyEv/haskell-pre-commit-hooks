FROM haskell:9.2.3 as hlint

RUN cabal update && cabal -j1 install hlint
ENTRYPOINT ["hlint"]

FROM haskell:9.0.2 as stylish-haskell

RUN cabal update && cabal install stylish-haskell
ENTRYPOINT ["stylish-haskell"]
