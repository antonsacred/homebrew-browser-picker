cask "browser-picker" do
  arch arm: "arm64", intel: "x64"

  version "1.0.9"
  sha256 arm: "9dee73f0961912e1982c7dc4372416dfe868d98b94911ceb80f59907c7041f62",
         intel: "9dee73f0961912e1982c7dc4372416dfe868d98b94911ceb80f59907c7041f62"

  url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/BrowserPicker-#{version}-#{arch}.zip"
  name "Browser Picker"
  desc "Menu bar default-browser router with per-profile routing rules"
  homepage "https://github.com/antonsacred/browser-picker"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "BrowserPicker.app"

  uninstall quit: "com.browserpicker.app"

  zap trash: [
    "~/Library/Application Support/BrowserPicker",
    "~/Library/Preferences/com.browserpicker.app.plist",
    "~/Library/Caches/com.browserpicker.app",
  ]
end
