class Pothossdr < Formula
  desc "Pothos SDR source and sink blocks"
  homepage "https://github.com/pothosware/pothos-sdr/wiki"
  head "https://github.com/pothosware/pothos-sdr.git"
  url "https://github.com/pothosware/pothos-sdr/archive/pothos-sdr-0.3.0.tar.gz"
  sha256 "1ccfd81e51c2ee88274f072a9ca259251035c532a7a1ecf9533bb10233d08059"

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
