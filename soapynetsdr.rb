class Soapynetsdr < Formula
  desc "Soapy SDR plugin for Net SDRs"
  homepage "https://github.com/pothosware/SoapyNetSDR/wiki"
  head "https://github.com/pothosware/SoapyNetSDR.git"
  url "https://github.com/pothosware/SoapyNetSDR/archive/soapy-netsdr-0.1.0.tar.gz"
  sha256 "6b3ce7eda15b58e6aad4f01a288dd3ca46924ea0650d878f97df72e9b77a6753"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
