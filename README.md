<!-- SPDX-License-Identifier: Apache-2.0 -->
# Scrape.do Homebrew tap

[![ci](https://github.com/scrape-do/homebrew-tap/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/scrape-do/homebrew-tap/actions/workflows/ci.yml) [![license](https://img.shields.io/github/license/scrape-do/homebrew-tap)](LICENSE)

The official [Homebrew](https://brew.sh) tap for the Scrape.do command-line tools, for macOS (Apple silicon and
Intel) and Linux (x86_64 and arm64).

| Formula | What it installs |
| ------- | ---------------- |
| `sdo` | The `sdo` command-line client for the [Scrape.do](https://scrape.do) API, with a bundled MCP server (`sdo mcp serve`). Source: [scrape-do/sdo-cli](https://github.com/scrape-do/sdo-cli). |
| `sdo-mcp` | `sdo-mcp`, the standalone Model Context Protocol server for the Scrape.do API. Source: [scrape-do/sdo-mcp](https://github.com/scrape-do/sdo-mcp). |

## Install

```bash
brew install scrape-do/tap/sdo
brew install scrape-do/tap/sdo-mcp
```

The first command taps this repository automatically. Homebrew only loads formulae from third-party taps you
trust, and installing a formula by its full name (`scrape-do/tap/sdo`) trusts that formula, so afterwards
`brew upgrade sdo` works by the short name. If you tap first and install by the short name, trust the tap:

```bash
brew tap scrape-do/tap
brew trust --tap scrape-do/tap
brew install sdo
```

## Upgrade

```bash
brew update
brew upgrade sdo
brew upgrade sdo-mcp
```

## Uninstall

```bash
brew uninstall sdo sdo-mcp
brew untap scrape-do/tap
```

## How the formulae are updated

The formulae install the prebuilt release archives published on GitHub; nothing is built from source. They are
not edited by hand: when a new version is released, the release workflow of
[sdo-cli](https://github.com/scrape-do/sdo-cli/blob/main/.github/workflows/release.yml) or
[sdo-mcp](https://github.com/scrape-do/sdo-mcp/blob/main/.github/workflows/release.yml) generates the formula from
that release's `checksums.txt` and commits it here after the GitHub Release exists. Release candidates are not
published to this tap.

Because the release pipeline writes these files (the commits are by `scrape-do-publisher[bot]` and titled
`sdo X.Y.Z` or `sdo-mcp X.Y.Z`), a hand edit here is overwritten by the next release. A change to a formula belongs
in its template in `tools/pkgmanifests/main.go` of [sdo-cli](https://github.com/scrape-do/sdo-cli/tree/main/tools/pkgmanifests)
or [sdo-mcp](https://github.com/scrape-do/sdo-mcp/tree/main/tools/pkgmanifests).

## Verifying a download

Every `sha256` in a formula is the one listed in that release's `checksums.txt`, which is signed with cosign
(keyless, recorded in the Rekor transparency log) by the release workflow, so Homebrew refuses an archive that
differs from the signed release. To verify the release files yourself, download `checksums.txt`,
`checksums.txt.cosign.bundle` and the archive from the GitHub Release and follow the steps in the
[Supply-Chain Integrity](https://github.com/scrape-do/sdo-cli/blob/main/SECURITY.md#supply-chain-integrity) section
of sdo-cli's SECURITY.md, or the [same section](https://github.com/scrape-do/sdo-mcp/blob/main/SECURITY.md#supply-chain-integrity)
of sdo-mcp's.

## Documentation, support and security

- API documentation: https://scrape.do/documentation
- Install, upgrade or hash problems with a formula: [GitHub Issues](https://github.com/scrape-do/homebrew-tap/issues)
  of this repository. Bugs and feature requests for the tools themselves:
  [sdo-cli issues](https://github.com/scrape-do/sdo-cli/issues) or [sdo-mcp issues](https://github.com/scrape-do/sdo-mcp/issues).
  Account, billing and API questions: support@scrape.do.
- Security issues: report them privately as described in [sdo-cli's SECURITY.md](https://github.com/scrape-do/sdo-cli/blob/main/SECURITY.md)
  or [sdo-mcp's SECURITY.md](https://github.com/scrape-do/sdo-mcp/blob/main/SECURITY.md), not in a public issue. Never
  post an API token in an issue.
- [Apache-2.0](LICENSE)
