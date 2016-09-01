class Pothossdr < Formula
  desc "Pothos SDR source and sink blocks"
  homepage "https://github.com/pothosware/pothos-sdr/wiki"
  head "https://github.com/pothosware/pothos-sdr.git"
  url "https://github.com/pothosware/pothos-sdr/archive/pothos-sdr-0.4.1.tar.gz"
  sha256 "d93f17f6a87c6166c25dc85d22cecd8ab8fa7d9afc501cc54fb91519e0aa6476"

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
