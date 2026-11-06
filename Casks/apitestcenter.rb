# Created with scripts/package-managers.mjs
cask "apitestcenter" do
  arch arm: "arm64", intel: "x64"

  version "0.20.0"
  sha256 arm:   "505f805543e6c47d36e9fd77af9460c8c9957756e8a67e61b9f90aa67f4c3993",
         intel: "c09f7d45ed464528e18e08afb4d2cb60d6bb6102e1dfc59f7d148405b144b4cb"

  url "https://github.com/apitestcenter/apitestcenter/releases/download/v#{version}/APITestCenter-#{version}-mac-#{arch}.dmg"
  name "APITestCenter"
  desc "API testing and load testing on your own computer"
  homepage "https://apitestcenter.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "APITestCenter.app"

  zap trash: [
    "~/Library/Application Support/ApiTestCenter",
    "~/Library/Logs/APITestCenter",
    "~/Library/Preferences/com.apitestcenter.desktop.plist",
    "~/Library/Saved Application State/com.apitestcenter.desktop.savedState",
  ]

  caveats <<~EOS
    APITestCenter is not notarized by Apple yet. If macOS says it "can't be opened",
    right-click the app in Applications and choose Open (once).
  EOS
end
