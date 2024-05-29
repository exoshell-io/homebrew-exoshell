cask "exoshell" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "6251c049e3749d9ffea09c9963b757db865af4319052f1f702295054b49f7f19",
         intel: "6718e7665ed7faaa743748c4a89ecb3617038bc121f49f8fa9294acef9c238a4"

  url "https://github.com/exoshell-dev/exoshell/releases/download/v#{version}/ExoShell_darwin_#{arch}.dmg",
      verified: "github.com/exoshell-dev/exoshell/"
  name "exoshell"
  desc "Modern terminal"
  homepage "https://exoshell.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "ExoShell.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/ExoShell.app"]
  end
end
