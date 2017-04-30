class Soapyairspy < Formula
  desc "Soapy SDR plugins for Airspy"
  homepage "https://github.com/pothosware/SoapyAirspy/wiki"
  head "https://github.com/pothosware/SoapyAirspy.git"
  url "https://github.com/pothosware/SoapyAirspy/archive/soapy-airspy-0.1.1.tar.gz"
  sha256 "21277c22aad441ce11be011d6f05383ba9d5192818151270566b1dacc670e1d5"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "airspy"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
