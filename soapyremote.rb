class Soapyremote < Formula
  homepage "https://github.com/pothosware/SoapyRemote/wiki"
  head "https://github.com/pothosware/SoapyRemote.git"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
