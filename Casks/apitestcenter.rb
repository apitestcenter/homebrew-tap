# Created with scripts/package-managers.mjs
cask "apitestcenter" do
  arch arm: "arm64", intel: "x64"

  version "0.18.0"
  sha256 arm:   "59fb5a9775d035d1a57dead1561574ee9096de04725f212d86d4b617ac06d0c8",
         intel: "edfeb1950a815fb554bc5474e732576bfd36fe5de5911cd73afbc410ff9b8a83"

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
