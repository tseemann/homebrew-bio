class Berokka < Formula
  desc "Trim, circularise and orient long read bacterial genome assemblies"
  homepage "https://github.com/tseemann/berokka"
  url "https://github.com/tseemann/berokka/archive/v0.1.tar.gz"
  sha256 "035b615b27540506e857657d1a02f84ec17cad02f97da9ae02330c7cb342f6e8"
  head "https://github.com/tseemann/berokka.git"

  depends_on "bioperl"
  depends_on "blast"

  def install
    bioperl = Formula["bioperl"].libexec/"lib/perl5"
    inreplace "bin/berokka", "use strict;\n", "use strict;\nuse lib '#{bioperl}';\n"
    prefix.install Dir["*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/berokka --version")
  end
end
