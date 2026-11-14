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
      url "https://github.com/scrape-do/sdo-cli/releases/download/v0.3.0/sdo_0.3.0_darwin_arm64.tar.gz"
      sha256 "0455f550b3f22a2f9600cc59340d1f429f0aa47f46d51b63be721d9f57617d4d"
    end
    on_intel do
      url "https://github.com/scrape-do/sdo-cli/releases/download/v0.3.0/sdo_0.3.0_darwin_amd64.tar.gz"
      sha256 "d3ea5223f37dbf7106e97620bb9357752ea6c08d01284fc22eabd172ba9aaf2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/scrape-do/sdo-cli/releases/download/v0.3.0/sdo_0.3.0_linux_arm64.tar.gz"
      sha256 "f05779054c49c31a6e16f475855d7e57f78278f2c002f34e242a0f4915b124ca"
    end
    on_intel do
      url "https://github.com/scrape-do/sdo-cli/releases/download/v0.3.0/sdo_0.3.0_linux_amd64.tar.gz"
      sha256 "f913eaca884478e9cdde743b8de84d4353eea4aed4b19b5f2a06ecfdcf6c218c"
    end
  end

  def install
    bin.install "sdo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sdo --version")
  end
end
