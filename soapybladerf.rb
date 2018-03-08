class Soapybladerf < Formula
  desc "Soapy SDR plugin for Blade RF"
  homepage "https://github.com/pothosware/SoapyBladeRF/wiki"
  head "https://github.com/pothosware/SoapyBladeRF.git"
  url "https://github.com/pothosware/SoapyBladeRF/archive/soapy-bladerf-0.3.5.tar.gz"
  sha256 "aeaf480779726c50cf9d5731d0c505f7d689e204370cf4b2b5af3321fe818091"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "libbladerf"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
