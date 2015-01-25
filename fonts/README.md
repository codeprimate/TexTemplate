```
# mkdir -p /usr/local/share/fonts
# cp GARA.TTF /usr/local/share/fonts/
# fc-cache /usr/local/share/fonts/
# fc-list | grep -i garamond
```

In your *.tex document:
`\setmainfont{Garamond}` or `\setmainfont[Ligatures=TeX]{Garamond}`
