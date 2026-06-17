cask "browser-picker" do
  version "21.0.7"

  on_arm do
    sha256 "3b3c649bed6096f1c80cd19b8887545056cf671215bf41762056bbbd96b5fa7c"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/Browserosaurus-darwin-arm64-#{version}.zip"
  end

  on_intel do
    sha256 "879d4f4d5718d6ebff3105b20d8cf5dc2d016463477228126aebfe2c3a02a099"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/Browserosaurus-darwin-x64-#{version}.zip"
  end

  name "Browserosaurus"
  desc "Browser prompter for macOS"
  homepage "https://github.com/antonsacred/browser-picker"

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Browserosaurus.app"

  uninstall quit: "com.browserosaurus"

  zap trash: [
    "~/Library/Application Support/Browserosaurus",
    "~/Library/Preferences/com.browserosaurus.plist",
    "~/Library/Saved Application State/com.browserosaurus.savedState",
  ]
end
