require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.2.9.tgz"
  sha256 "c35978cadd9f186f4734ddaa8faba37b613a1b12e72dbd5faae86ff3e8a70dec"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "f653f0fe252840fc3d0d2ede152d0f5411b3d8ac2f9a474b7b0dd482b374df12"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
