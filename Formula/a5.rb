class A5 < Formula
  # cite Tritt_2012: "https://doi.org/10.1371/journal.pone.0042304"
  desc "Pipeline for de novo assembly of microbial genomes"
  homepage "https://sourceforge.net/projects/ngopt/"
  if OS.mac?
    url "https://downloads.sourceforge.net/project/ngopt/a5_miseq_macOS_20160825.tar.gz"
    sha256 "e89b2c3b6d1fe030c82cce4089023fee8320297c9bf251d49d6bc6a5210f8350"
  else
    url "https://downloads.sourceforge.net/project/ngopt/a5_miseq_linux_20160825.tar.gz"
    sha256 "76a2798d617d45f4539e73ef2df5f899503ac4a54c3a406faf37db6282127fe9"
  end

  depends_on "bwa"
  depends_on "idba"
  depends_on "samtools"
  depends_on "java"
  depends_on "bwa"
  depends_on "samtools"
  depends_on "sga"
  depends_on "trimmomatic"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "../libexec/bin/a5_pipeline.pl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/a5_pipeline.pl -h 2>&1", 255)
    system "#{libexec}/test.a5.sh"
  end
end
