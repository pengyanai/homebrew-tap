class MirrorRs < Formula
  desc "Seamless, transparent Docker registry mirror proxy with speed-based load balancing"
  homepage "https://github.com/pengyanai/mirror-rs"
  version "0.1.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/mirror-rs/releases/download/v0.1.1/mirror-rs-aarch64-apple-darwin.tar.gz"
      sha256 "f4bebe6c82fb6a518586fc60ece7116a5d85dc8b58ffcd0f0202c31ca6e5caaf"
    else
      url "https://github.com/pengyanai/mirror-rs/releases/download/v0.1.1/mirror-rs-x86_64-apple-darwin.tar.gz"
      sha256 "b9b89e701e7c32ba79196cd6a24713bcd611259e2c5e1038894da93d5b21931e"
    end
  else
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/mirror-rs/releases/download/v0.1.1/mirror-rs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7c308d46131740afd4c16d66f761c2b3cf40928e1e6ab24b473b13e8fc64aa7d"
    else
      url "https://github.com/pengyanai/mirror-rs/releases/download/v0.1.1/mirror-rs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9c108ea0ec28a4c0fac05a1d33252df624707f1ffad559eb34a205bf36ea5158"
    end
  end

  def install
    bin.install "mirror-rs"
  end

  test do
    system bin/"mirror-rs", "--version"
  end
end
