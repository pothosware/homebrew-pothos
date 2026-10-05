class Soapyhackrf < Formula
  desc "Soapy SDR plugin for Hack RF"
  homepage "https://github.com/pothosware/SoapyHackRF/wiki"
  head "https://github.com/pothosware/SoapyHackRF.git"
  version "0.3.4-9"
  url "https://github.com/pothosware/SoapyHackRF/archive/8a71ab32f6269708e3a9c96946c071316b959ce4.zip"
  sha256 "6ad7894e701a2defe405aa767dd9989890461a9d209d1319b022cb6d044494d0"

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
