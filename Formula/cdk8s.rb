require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.150.tgz"
  sha256 "4c159635bab1cb6fc2b255b21eff780090f7a42490a70de41ee0dcf1cce1465b"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "051feacc93ed49abfb4167f2656cbf3716f9ee8051651ea2dfc8c07f13c0fa69"
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
