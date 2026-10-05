class Soapyairspyhf < Formula
  desc "Soapy SDR plugins for AirspyHF+"
  homepage "https://github.com/pothosware/SoapyAirspyHF/wiki"
  head "https://github.com/pothosware/SoapyAirspyHF.git"
  version "0.2.0-5"
  url "https://github.com/pothosware/SoapyAirspyHF/archive/07c693b1233a9816a6a468e5455db92ff120cfce.zip"
  sha256 "711f8fb645e297bbda49d1d055610b9c38a135cd1a532517c2fb7e0dcd5843ec"

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
