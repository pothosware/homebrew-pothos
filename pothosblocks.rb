class Pothosblocks < Formula
  desc "Pothos core processing blocks"
  homepage "https://github.com/pothosware/PothosBlocks/wiki"
  head "https://github.com/pothosware/PothosBlocks.git"
  url "https://github.com/pothosware/PothosBlocks/archive/pothos-blocks-0.5.0.tar.gz"
  sha256 "fc1605f80137afe98df12a7030cfc267cac179dbf3b02e6078d126e2b34fc5d7"

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
