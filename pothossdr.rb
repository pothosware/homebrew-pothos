class Pothossdr < Formula
  desc "Pothos SDR source and sink blocks"
  homepage "https://github.com/pothosware/PothosSoapy/wiki"
  head "https://github.com/pothosware/PothosSoapy.git"
  url "https://github.com/pothosware/PothosSoapy/archive/pothos-sdr-0.4.4.tar.gz"
  sha256 "f889a3ee9c76e1838924db0dfa6cd90ab1a10945623c36a394d8008f55484d88"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
