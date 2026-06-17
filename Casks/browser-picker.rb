cask "browser-picker" do
  version "21.0.13"

  on_arm do
    sha256 "5da069a81692605033da1876d0d32452007ec154ca228ee9db590f6ca8f34e8f"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-arm64-#{version}.zip"
  end

  on_intel do
    sha256 "bceb985b66ec23f30250a7f0d731fa930b393fd8626987f595474c624c2016ba"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-x64-#{version}.zip"
  end

  name "browser-picker"
  desc "Browser prompter for macOS"
  homepage "https://github.com/antonsacred/browser-picker"

  depends_on macos: :monterey

  app "browser-picker.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/browser-picker.app"]
    system_command "/usr/bin/codesign", args: ["--force", "--deep", "--sign", "-", "#{appdir}/browser-picker.app"]
  end

  uninstall quit: "com.browser-picker"

  zap trash: [
    "~/Library/Application Support/browser-picker",
    "~/Library/Preferences/com.browser-picker.plist",
    "~/Library/Saved Application State/com.browser-picker.savedState",
  ]
end
