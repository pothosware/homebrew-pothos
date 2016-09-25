class Pothosblocks < Formula
  desc "Pothos core processing blocks"
  homepage "https://github.com/pothosware/pothos-blocks/wiki"
  head "https://github.com/pothosware/pothos-blocks.git"
  url "https://github.com/pothosware/pothos-blocks/archive/pothos-blocks-0.4.1.tar.gz"
  sha256 "05fc4c0c6876bb34869b49db0d882d52d3513d232ac475ba0de1156d8e1d0cc5"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
