cask "remotecrab" do
  version "1.4.4"
  sha256 "5cfa368842a63fd956e7ece44dcfcc566429afe42ed82641fb211a53b3b1bea7"

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
