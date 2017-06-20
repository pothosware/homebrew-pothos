class Soapyhackrf < Formula
  desc "Soapy SDR plugin for Hack RF"
  homepage "https://github.com/pothosware/SoapyHackRF/wiki"
  head "https://github.com/pothosware/SoapyHackRF.git"
  url "https://github.com/pothosware/SoapyHackRF/archive/soapy-hackrf-0.3.1.tar.gz"
  sha256 "e5b29038d1dd839fa3062f133307534c3fe7d18fa1f7ce482b24dc07e15879d7"

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
