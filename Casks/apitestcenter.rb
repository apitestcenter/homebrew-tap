# Created with scripts/package-managers.mjs
cask "apitestcenter" do
  arch arm: "arm64", intel: "x64"

  version "0.18.1"
  sha256 arm:   "4bdab3bdb4ae0bfc703ec7c4ce59d9f4ff19ef1629ee952a9210cf7850bf5164",
         intel: "97dcc4d5c8a35c34fc71ea2f280423afe4a97914ecbeefb2f84c96ad1e3a2bda"

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
