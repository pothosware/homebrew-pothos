class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/PothosComms/wiki"
  head "https://github.com/pothosware/PothosComms.git"
  url "https://github.com/pothosware/PothosComms/archive/pothos-comms-0.3.1.tar.gz"
  sha256 "3c8014326d95291f6d444f1f5f2a0597f8435235a8da54fafeb94056712ca920"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "pothosware/pothos/spuce"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
