class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/PothosComms/wiki"
  head "https://github.com/pothosware/PothosComms.git"
  url "https://github.com/pothosware/PothosComms/archive/pothos-comms-0.2.2.tar.gz"
  sha256 "43baa8606f86528cceecb170f89f508a92fe83bb1e46b6392fd674d5d36cefd5"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "audiofilter/spuc/spuce"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
