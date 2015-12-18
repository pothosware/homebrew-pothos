class Pothossdr < Formula
  desc "Pothos SDR source and sink blocks"
  homepage "https://github.com/pothosware/pothos-sdr/wiki"
  head "https://github.com/pothosware/pothos-sdr.git"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
