class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/pothos-comms/wiki"
  head "https://github.com/pothosware/pothos-comms.git"
  url "https://github.com/pothosware/pothos-comms/archive/pothos-comms-0.2.1.tar.gz"
  sha256 "f14f89a6f5d695cedac4dcd95c30a2f21fde20e306e61e5d2a1e4756f74ba9bc"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "audiofilter/spuc/spuce"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
