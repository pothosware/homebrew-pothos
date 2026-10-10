class Soapyairspyhf < Formula
  desc "Soapy SDR plugins for AirspyHF+"
  homepage "https://github.com/pothosware/SoapyAirspyHF/wiki"
  head "https://github.com/pothosware/SoapyAirspyHF.git"
  url "https://github.com/pothosware/SoapyAirspyHF/archive/soapy-airspyhf-0.2.1.tar.gz"
  sha256 "17f73322f46bd6172a82208a1df6992755c4028098b8aa47d2d6f4d0ab449065"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "pothosware/pothos/airspyhf"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
