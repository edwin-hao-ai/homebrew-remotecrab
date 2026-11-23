cask "remotecrab" do
  version "1.4.5"
  sha256 "951d0e1ffd7ae1624150eb7fa61c158449271b06947f39089e1fc95c024ee177"

  url "https://vgoapp.com/downloads/RemoteCrab-#{version}.dmg"
  name "RemoteCrab"
  desc "Use an iPhone as a camera, microphone, trackpad and keyboard"
  homepage "https://vgoapp.com/remotecrab/"

  # The feed is the update mechanism the app itself uses, so one source of truth
  # for both. `strategy :sparkle` reads <sparkle:shortVersionString>.
  livecheck do
    url "https://vgoapp.com/downloads/appcast.xml"
    strategy :sparkle
  end

  # Sparkle updates the app in place; Homebrew must not fight it.
  auto_updates true
  depends_on macos: :tahoe

  app "RemoteCrab.app"

  uninstall launchctl: "com.remotecrab.keepawake",
            quit:      "com.remotecrab.RemoteCrabReceiver"

  zap trash: [
    "~/Library/Application Support/RemoteCrab",
    "~/Library/Caches/com.remotecrab.RemoteCrabReceiver",
    "~/Library/HTTPStorages/com.remotecrab.RemoteCrabReceiver",
    "~/Library/Preferences/com.remotecrab.RemoteCrabReceiver.plist",
    "~/Library/Saved Application State/com.remotecrab.RemoteCrabReceiver.savedState",
  ]
end
