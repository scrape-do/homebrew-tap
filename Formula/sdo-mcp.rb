class SdoMcp < Formula
  desc "Model Context Protocol server for the Scrape.do web scraping API"
  homepage "https://scrape.do"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/scrape-do/sdo-mcp/releases/download/v0.3.0/sdo-mcp_0.3.0_darwin_arm64.tar.gz"
      sha256 "e088c6adc9c7bb83cdfb23a6e69f42c281669c916dcc2e408f5f154c1b5d1862"
    end
    on_intel do
      url "https://github.com/scrape-do/sdo-mcp/releases/download/v0.3.0/sdo-mcp_0.3.0_darwin_amd64.tar.gz"
      sha256 "38410d51524c13285a55a511abf584060f9be02f7188608321406e9018c47560"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/scrape-do/sdo-mcp/releases/download/v0.3.0/sdo-mcp_0.3.0_linux_arm64.tar.gz"
      sha256 "f615eb13fd4eb8be7c91429fd4dd73c6febaa4df5c3eef50e5c2857d7e2ffdd3"
    end
    on_intel do
      url "https://github.com/scrape-do/sdo-mcp/releases/download/v0.3.0/sdo-mcp_0.3.0_linux_amd64.tar.gz"
      sha256 "405e359a351676f596a99c37d59f89e377c0b7647ae9e09f8a4584699a305e2c"
    end
  end

  def install
    bin.install "sdo-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sdo-mcp version")
  end
end
