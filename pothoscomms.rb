class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/pothos-comms/wiki"
  head "https://github.com/pothosware/pothos-comms.git"
  url "https://github.com/pothosware/pothos-comms/archive/pothos-comms-0.1.2.tar.gz"
  sha256 "e32e4e1d7b0824ea257963c52114fe051d5f496de60174b6cf02198978513221"

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
