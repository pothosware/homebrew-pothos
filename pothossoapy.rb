class Pothossoapy < Formula
  desc "Pothos SDR source and sink blocks"
  homepage "https://github.com/pothosware/PothosSoapy/wiki"
  head "https://github.com/pothosware/PothosSoapy.git"
  url "https://github.com/pothosware/PothosSoapy/archive/pothos-soapy-0.5.1.tar.gz"
  sha256 "4dae46fe1763d9c32fc5706e65318166de389d9b946420297f00b7df55c052bc"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
