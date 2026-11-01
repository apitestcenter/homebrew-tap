# Created with scripts/package-managers.mjs
cask "apitestcenter" do
  arch arm: "arm64", intel: "x64"

  version "0.17.2"
  sha256 arm:   "582658f1d6465158525894cc88071ffd68b364b7b9ad08355431cd1e36cec680",
         intel: "684b797e2d7617b3ee19a03b3ae75ceabf897af0b4428990ef9086c154bcd51e"

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
