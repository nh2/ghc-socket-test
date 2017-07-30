# ghc-socket-test

Test case for socket functionality in https://ghc.haskell.org/trac/ghc/ticket/13497

Usage:

```
$ PATH=$HOME/ghc/inplace/bin:$PATH cabal install --with-ghc=$HOME/ghc/inplace/bin/ghc-stage2 network

Resolving dependencies...
Downloading network-2.6.3.2...
Configuring network-2.6.3.2...
Building network-2.6.3.2...
Installed network-2.6.3.2

$ PATH=$HOME/ghc/inplace/bin:$PATH cabal configure --with-ghc=$HOME/ghc/inplace/bin/ghc-stage2

Resolving dependencies...
Configuring ghc-socket-test-1.0...

$ cabal build

$ dist/build/ghc-socket-test/ghc-socket-test
```

Then send it something:

```
$ echo hi | nc 127.0.0.1 1234
Got: hi
```
