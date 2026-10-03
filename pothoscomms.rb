class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/PothosComms/wiki"
  revision 1
  head "https://github.com/pothosware/PothosComms.git"
  url "https://github.com/pothosware/PothosComms/archive/pothos-comms-0.3.5.tar.gz"
  sha256 "d9e7524eb668350209b45c1a195a3427d86362974d600ecfe5625596ddb775e4"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "audiofilter/spuc/spuce"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
