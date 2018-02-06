## Settings
- GNU Emacs 25.3.1
- install with Homebrew ```brew cask install emacs```

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
- Don't use ```:q```, quits Emacs in full screen mode without warning
