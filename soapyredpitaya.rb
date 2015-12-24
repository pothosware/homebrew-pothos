class Soapyredpitaya < Formula
  desc "Soapy SDR plugin for Red Pitaya"
  homepage "https://github.com/pothosware/SoapyRedPitaya/wiki"
  head "https://github.com/pothosware/SoapyRedPitaya.git"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
