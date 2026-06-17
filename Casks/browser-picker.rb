cask "browser-picker" do
  version "21.0.11"

  on_arm do
    sha256 "0ab94d26df413741e2023f5ec5bab58a2a7259aee307109dd6dc8b3181bcabf0"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-arm64-#{version}.zip"
  end

  on_intel do
    sha256 "c7dfa2eec28fb9c6c592e56bb4d05909cacafbf869116f4065ae4f384b8fe948"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-x64-#{version}.zip"
  end

  name "browser-picker"
  desc "Browser prompter for macOS"
  homepage "https://github.com/antonsacred/browser-picker"

  auto_updates true
  depends_on macos: :monterey

  app "browser-picker.app"

  uninstall quit: "com.browser-picker"

  zap trash: [
    "~/Library/Application Support/browser-picker",
    "~/Library/Preferences/com.browser-picker.plist",
    "~/Library/Saved Application State/com.browser-picker.savedState",
  ]
end
