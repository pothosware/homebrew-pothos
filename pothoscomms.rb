class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/pothos-comms/wiki"
  head "https://github.com/pothosware/pothos-comms.git"
  url "https://github.com/pothosware/pothos-comms/archive/pothos-comms-0.1.1.tar.gz"
  sha256 "848c82e2e014436fd145f78cd5c91e2c77c53f26ce045343d7f1312f7f017d53"

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
