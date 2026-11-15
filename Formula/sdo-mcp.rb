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
      url "https://github.com/scrape-do/sdo-mcp/releases/download/v0.3.1/sdo-mcp_0.3.1_darwin_arm64.tar.gz"
      sha256 "9c84832db25965edda36d86ac7c32e0b8ad4a534bfb28d5373d4ca71bc366097"
    end
    on_intel do
      url "https://github.com/scrape-do/sdo-mcp/releases/download/v0.3.1/sdo-mcp_0.3.1_darwin_amd64.tar.gz"
      sha256 "da9a8bd615b2f40b21ebc7064483a1addeeac8a903fa3f3f6c607f7c3b20e3d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/scrape-do/sdo-mcp/releases/download/v0.3.1/sdo-mcp_0.3.1_linux_arm64.tar.gz"
      sha256 "26299c918372fd1c131116c66859baaf5057371b35ca70bdea19781aa633e229"
    end
    on_intel do
      url "https://github.com/scrape-do/sdo-mcp/releases/download/v0.3.1/sdo-mcp_0.3.1_linux_amd64.tar.gz"
      sha256 "ec4e778410e1bf097f79a0c6c4b869179a4a5749175fa3ca2b969683cadafd4a"
    end
  end

  def install
    bin.install "sdo-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sdo-mcp version")
  end
end
