class Pothosblocks < Formula
  desc "Pothos core processing blocks"
  homepage "https://github.com/pothosware/pothos-blocks/wiki"
  head "https://github.com/pothosware/pothos-blocks.git"
  url "https://github.com/pothosware/pothos-blocks/archive/pothos-blocks-0.4.3.tar.gz"
  sha256 "96d1ae6722f92df42ea53c268c8fd1ce5276ffe2b928065055faa8a066e060c6"

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
