class MovieboxTui < Formula
  VERSION = "0.1.14"
  MACOS_SHA256 = "acb0e8aecf4a4d9b34e19930e5d21f5b1ad771c36738b82f1eb604a49187ec1e"
  LINUX_X64_SHA256 = "c04754bf4bbbddbffcb87fdec771209d2c4d734a7a28d3b45555c2ae33b31cac"
  LINUX_ARM64_SHA256 = "d3dfe72b8e5aee057db0daa2425be5f982eb67dba320ab86aee77d8cbfd0605c"

  desc "Stream movies, shows, anime, and live TV from your terminal"
  homepage "https://github.com/mesamirh/MovieBox-Tui"
  version VERSION
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_macOS_Universal.tar.gz"
    sha256 MACOS_SHA256
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_arm64.tar.gz"
      sha256 LINUX_ARM64_SHA256
    else
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_x64.tar.gz"
      sha256 LINUX_X64_SHA256
    end
  end

  def install
    bin.install "moviebox-tui"
  end

  test do
    system "#{bin}/moviebox-tui", "--version"
  end
end
