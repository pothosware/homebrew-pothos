class Soapyairspyhf < Formula
  desc "Soapy SDR plugins for AirspyHF+"
  homepage "https://github.com/pothosware/SoapyAirspyHF/wiki"
  head "https://github.com/pothosware/SoapyAirspyHF.git"
  url "https://github.com/pothosware/SoapyAirspyHF/archive/soapy-airspyhf-0.2.0.tar.gz"
  sha256 "f134ddc491151dfeb1ed9ca5a614d207d493b89fef173b325ce9e6f4e07884b3"

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
