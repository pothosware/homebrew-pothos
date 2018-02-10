class Soapyairspyhf < Formula
  desc "Soapy SDR plugins for AirspyHF+"
  homepage "https://github.com/pothosware/SoapyAirspyHF/wiki"
  head "https://github.com/pothosware/SoapyAirspyHF.git"

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
