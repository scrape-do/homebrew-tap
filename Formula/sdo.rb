class Sdo < Formula
  desc "Scrape.do command-line client, with a bundled MCP server"
  homepage "https://scrape.do"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/scrape-do/sdo-cli/releases/download/v0.3.1/sdo_0.3.1_darwin_arm64.tar.gz"
      sha256 "28eb07d3a6c311f78d220e9de8ee3096834248f082cae69dc12d888051055b38"
    end
    on_intel do
      url "https://github.com/scrape-do/sdo-cli/releases/download/v0.3.1/sdo_0.3.1_darwin_amd64.tar.gz"
      sha256 "a3e9b14135875d640af5a4f1ef2b8c55147f66d1980c82222f2350e7ba1a2f6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/scrape-do/sdo-cli/releases/download/v0.3.1/sdo_0.3.1_linux_arm64.tar.gz"
      sha256 "9924297516e0b920eb71e598c34ea489c82ec103ee99fa63a0b66fbd069b3cdb"
    end
    on_intel do
      url "https://github.com/scrape-do/sdo-cli/releases/download/v0.3.1/sdo_0.3.1_linux_amd64.tar.gz"
      sha256 "6810116cb71e080d63fe258c9421596a0e8f46820dafc36aab847713093c2572"
    end
  end

  def install
    bin.install "sdo"
    generate_completions_from_executable(bin/"sdo", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sdo --version")
  end
end
