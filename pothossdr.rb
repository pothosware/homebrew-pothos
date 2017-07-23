class Pothossdr < Formula
  desc "Pothos SDR source and sink blocks"
  homepage "https://github.com/pothosware/pothos-sdr/wiki"
  head "https://github.com/pothosware/pothos-sdr.git"
  url "https://github.com/pothosware/pothos-sdr/archive/pothos-sdr-0.4.4.tar.gz"
  sha256 "cd6e15b8025c984c0463c1620a942bc35bca2e813113dda3bf2a116bed7afeb9"

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
