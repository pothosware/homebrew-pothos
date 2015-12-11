class Soapyhackrf < Formula
  desc "Soapy SDR plugin for Hack RF"
  homepage "https://github.com/pothosware/SoapyHackRF/wiki"
  head "https://github.com/pothosware/SoapyHackRF.git"
  url "https://github.com/pothosware/SoapyHackRF/archive/soapy-hackrf-0.2.0.tar.gz"
  sha256 "e944e9c1990f535f8f591cbf76574ec4ad6ea01b89f914bdd404843e459dd858"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "hackrf"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
