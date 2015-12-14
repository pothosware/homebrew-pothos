class Muparserx < Formula
  desc "the muparserx math parser library"
  homepage "http://articles.beltoforion.de/article.php?a=muparserx"
  head "https://github.com/beltoforion/muparserx.git"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
