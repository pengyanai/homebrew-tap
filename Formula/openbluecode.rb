class Openbluecode < Formula
  desc "Expose BlueCode-authenticated models to Claude Code and Claude Desktop 3p"
  homepage "https://github.com/pengyanai/homebrew-tap"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.8/openbluecode_v0.2.8_darwin_arm64.tar.gz"
      sha256 "3970c07a7f2bf46b2ee351a412601c48d2934cc3fd701b7d773f55fb5531b731"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.8/openbluecode_v0.2.8_darwin_amd64.tar.gz"
      sha256 "2279800de7993884c2fb4f2305e23f22d567ef95fa93a8e1c9b91426a8918237"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.8/openbluecode_v0.2.8_linux_arm64.tar.gz"
      sha256 "c3de158eec8c2fabc946174cca49ad14e60da05aa0b1c10c6835e2c123d11293"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.8/openbluecode_v0.2.8_linux_amd64.tar.gz"
      sha256 "cb651cee92c62d9330b6d9609c7fa80a20766bea2edf1070966e85bdbd04a981"
    end
  end

  def install
    bin.install Dir["openbluecode_*"].first => "openbluecode"
  end

  def caveats
    <<~EOS
      Finish setup (register the login item and print client config):

        openbluecode install

      Then open http://127.0.0.1:18981 and pick a model per tier.
    EOS
  end

  test do
    assert_match "openbluecode", shell_output("#{bin}/openbluecode version")
  end
end
