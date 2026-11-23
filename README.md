# homebrew-remotecrab

Homebrew tap for [RemoteCrab](https://vgoapp.com/remotecrab/) — an iPhone or
iPad as a camera, microphone, trackpad and keyboard for your Mac.

```bash
brew tap edwin-hao-ai/remotecrab
brew install --cask remotecrab
```

Requires macOS 26 or newer. The app updates itself (Sparkle); Homebrew only
installs it. Uninstall with `brew uninstall --cask remotecrab`, and
`--zap` removes the app's preferences and caches (your recordings in
`~/Movies/RemoteCrab` and received files in `~/Downloads/RemoteCrab` are left
alone on purpose).

The cask pins the version and sha256 of the published DMG; it is updated with
each release.
