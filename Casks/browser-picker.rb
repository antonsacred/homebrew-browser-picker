cask "browser-picker" do
  version "21.0.10"

  on_arm do
    sha256 "82f1f00347999cfc1d72207ffdde3ae5f11dc87009b98874e2a9c561fa99b980"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-arm64-#{version}.zip"
  end

  on_intel do
    sha256 "70a7c0489a3695e880b589230144cb40610e1f15da891faa14bb6f5381d42426"
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
