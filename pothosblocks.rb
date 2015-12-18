class Pothosblocks < Formula
  desc "Pothos core processing blocks"
  homepage "https://github.com/pothosware/pothos-blocks/wiki"
  head "https://github.com/pothosware/pothos-blocks.git"

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
