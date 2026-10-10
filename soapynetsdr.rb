class Soapynetsdr < Formula
  desc "Soapy SDR plugin for Net SDRs"
  homepage "https://github.com/pothosware/SoapyNetSDR/wiki"
  head "https://github.com/pothosware/SoapyNetSDR.git"
  url "https://github.com/pothosware/SoapyNetSDR/archive/soapy-netsdr-0.2.1.tar.gz"
  sha256 "224d54811c27cf16bc6a48961177c61966ad5a06f4942966d39bf4328a0f852f"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
