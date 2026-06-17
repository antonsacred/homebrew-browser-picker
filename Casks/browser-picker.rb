cask "browser-picker" do
  version "21.0.9"

  on_arm do
    sha256 "18802dd33e1677b3f02937eda82db1111b2ac1df597faea5e086d381b7ab51bb"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-arm64-#{version}.zip"
  end

  on_intel do
    sha256 "b54659d33c25a3c42420f4d555abdb90b348aa9a523f11242a9eb38e769e5634"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-x64-#{version}.zip"
  end

  name "browser-picker"
  desc "Browser prompter for macOS"
  homepage "https://github.com/antonsacred/browser-picker"

  auto_updates true
  depends_on macos: ">= :monterey"

  app "browser-picker.app"

  uninstall quit: "com.browser-picker"

  zap trash: [
    "~/Library/Application Support/browser-picker",
    "~/Library/Preferences/com.browser-picker.plist",
    "~/Library/Saved Application State/com.browser-picker.savedState",
  ]
end
