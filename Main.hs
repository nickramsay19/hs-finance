import System.IO
import Control.Monad
-- import System.Exit (exitSuccess)

command :: String -> [Double] -> String
command "" d = ""
command "help" d = "Showing a list of available commands:\nhelp - Shows this help text\nversion - Shows the current version\nhead - Shows the top most entry\ntail - Shows the final entry\ntotal - Shows the running total of entries"
command "version" d = "1.0"
command "head" d = show $ head d
command "tail" d = show $ last d
command "total" d = show $ sum d
command s d = "Unknown command: " ++ s

prompt = do
    -- Get data from file
    let list = []
    handle <- openFile "data.csv" ReadMode
    contents <- hGetContents handle
    let singlewords = words contents
        list = map read singlewords :: [Double] 
    
    -- Print prompt and get input
    putStr "~ "
    hFlush stdout
    i <- getLine

    -- Enact appropriate action based on command
    putStrLn $ command i list

    -- Close reading
    hClose handle

-- Begin Main
main :: IO ()
main = do
    putStrLn "Welcome to Finance 1.0\nDeveloped by Nicholas Ramsay"
    forever prompt
    
    

