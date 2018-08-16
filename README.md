# vim-logutils

This plugin eases visual parsing of log files by highlighting each line with a specific color.
Right now it works only with specific loggrs in following format:

```
[INFO|WARN|DEBUG|ERROR]:LOGGER_NAME: stuff
```

Plugin has three options for highlighting:
1. Load configuration from file.
   This loads configuration from supplied filed and highlights all lines that match loggers in file.
   Put file named 'log_highlighter' into your %VIM% folder
   Example config file:
     ```
     Logger1 Yellow
     Something.Logger2 Cyan
     Leeroy.Jenkins.Logger #00FF00
     ```
     
   Call it with `<leader>hs` ("Highlight with settings")
   Open config file with `<leader>ho` ("Highlighter Open config")
   
2. Make configuration on the fly from the current buffer.
   This parses the whole file and assigns a random greenish color
   
   Call it with `<leader>ha` ("Highlight automatically")
   
3. Hybrid mode. First it reads config from file, then reads from buffer without overwriting values from the file.
   
   Call it with `<leader>hh` ("Highlight hybrid")
   

To clear highlighting, use `<leader>hc` ("Highlight clear")

