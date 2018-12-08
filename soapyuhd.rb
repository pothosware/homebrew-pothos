class Soapyuhd < Formula
  desc "Soapy SDR plugins for UHD devices"
  homepage "https://github.com/pothosware/SoapyUHD/wiki"
  head "https://github.com/pothosware/SoapyUHD.git"
  url "https://github.com/pothosware/SoapyUHD/archive/soapy-uhd-0.3.5.tar.gz"
  sha256 "824911253da0cdadd84481d4d98c6124c71431b69774bc6b138ddbdae0e6182b"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "boost"
  depends_on "uhd"

  def install

    args = []
    args += %W[-DUHD_ROOT='.']

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
