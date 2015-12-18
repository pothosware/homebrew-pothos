class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/pothos-comms/wiki"
  head "https://github.com/pothosware/pothos-comms.git"
  url "https://github.com/pothosware/pothos-comms/archive/pothos-comms-0.1.0.tar.gz"
  sha256 "4f16616d92dd99eb30b6798a5d00d3f2b6b5a898368dee59da18cfe5b1d19a35"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "spuce"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
