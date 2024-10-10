# Thor: to install fonts
get the `*.ttf`, put it here (`~/.share/local/fonts`), it should be installed. Verify:
- `fc-list -f -v | rg fontname`

If that failed, try: `fc-cache -f -v`, and try again. Else, try gnome desktop's gui.
