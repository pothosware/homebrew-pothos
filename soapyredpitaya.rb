class Soapyredpitaya < Formula
  desc "Soapy SDR plugin for Red Pitaya"
  homepage "https://github.com/pothosware/SoapyRedPitaya/wiki"
  head "https://github.com/pothosware/SoapyRedPitaya.git"
  url "https://github.com/pothosware/SoapyRedPitaya/archive/soapy-redpitaya-0.1.1.tar.gz"
  sha256 "71306b1bdc4bd53b059e374797e4ad86672221d5f8534bda60f2dc726005be50"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
