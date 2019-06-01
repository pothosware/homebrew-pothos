class Soapynetsdr < Formula
  desc "Soapy SDR plugin for Net SDRs"
  homepage "https://github.com/pothosware/SoapyNetSDR/wiki"
  head "https://github.com/pothosware/SoapyNetSDR.git"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
