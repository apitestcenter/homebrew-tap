# Created with scripts/package-managers.mjs
cask "apitestcenter" do
  arch arm: "arm64", intel: "x64"

  version "0.21.0"
  sha256 arm:   "525da9c5149e257403d9c1014cb795d1351bc7740c4b0b790a8548fe8531385e",
         intel: "6e75aab7eef953a8195b6f51def1f230c3b56c74ed3a7d5882441d6e1de5fe78"

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
