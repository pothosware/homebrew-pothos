class Soapybladerf < Formula
  desc "Soapy SDR plugin for Blade RF"
  homepage "https://github.com/pothosware/SoapyBladeRF/wiki"
  head "https://github.com/pothosware/SoapyBladeRF.git"
  url "https://github.com/pothosware/SoapyBladeRF/archive/soapy-bladerf-0.3.3.tar.gz"
  sha256 "5c80c946d9f6ce1120682c87b449a09032e0abddc960af5b0ee16def08fe5ad9"

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
