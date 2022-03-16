class Pothosblocks < Formula
  desc "Pothos core processing blocks"
  homepage "https://github.com/pothosware/PothosBlocks/wiki"
  revision 1
  head "https://github.com/pothosware/PothosBlocks.git"
  url "https://github.com/pothosware/PothosBlocks/archive/pothos-blocks-0.5.3.tar.gz"
  sha256 "426338f7e398353ac074ea762a5962a2a699370bc812700e635de2170dd574e7"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
