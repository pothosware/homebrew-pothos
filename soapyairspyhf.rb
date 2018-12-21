class Soapyairspyhf < Formula
  desc "Soapy SDR plugins for AirspyHF+"
  homepage "https://github.com/pothosware/SoapyAirspyHF/wiki"
  head "https://github.com/pothosware/SoapyAirspyHF.git"
  url "https://github.com/pothosware/SoapyAirspyHF/archive/soapy-airspyhf-0.1.0.tar.gz"
  sha256 "8029925abbda64518947c72006afa156f24dc461d2486c4333f5b8e11463514d"

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
