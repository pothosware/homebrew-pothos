class Muparserx < Formula
  desc "the muparserx math parser library"
  homepage "http://articles.beltoforion.de/article.php?a=muparserx"
  head "https://github.com/beltoforion/muparserx.git"
  url "https://github.com/beltoforion/muparserx/archive/v4.0.7.tar.gz"
  sha256 "dd3c68da70a7177224fba015de8a948f2c8e6940d3c6ecde1a87d87ed97d6edf"

  depends_on "cmake" => :build

  def install
    mkdir "builddir" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
