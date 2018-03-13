## Settings
- GNU Emacs 27.0.50 (HEAD)
- install with Homebrew 
```brew install emacs --with-cocoa --with-gnutls --with-rsvg --with-imagemagick```

## Rtags
- Export compile commands json file with
```cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . ```
- Start daemon
```
brew services start rtags
rdm &
rc -J .
```
- Open project in emacs

## Notes
- Emacs >26.0 fixes the quit on ```:q``` in full screen mode on MacOSX
