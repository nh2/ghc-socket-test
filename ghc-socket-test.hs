{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (forever)
import Network.Socket
import System.IO

-- Simple echo server: Reads up to 10 chars from network, echoes them back.
-- Uses the Handle API so that `hWaitForInput` can be used.
main :: IO ()
main = do
  sock <- socket AF_INET Stream 0
  setSocketOption sock ReuseAddr 1
  bind sock (SockAddrInet 1234 0x0100007f) -- 0x0100007f == 127.0.0.1 localhost
  listen sock 2
  forever $ do
    (connSock, _connAddr) <- accept sock
    putStrLn "Got connection"

    h <- socketToHandle connSock ReadWriteMode
    hSetBuffering h NoBuffering

    ready <- hWaitForInput h (5 * 1000) -- 5 seconds
    putStrLn $ "Ready: " ++ show ready

    line <- hGetLine h
    putStrLn "Got line"
    hPutStrLn h ("Got: " ++ line)
    hClose h
