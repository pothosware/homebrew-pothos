class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/PothosComms/wiki"
  head "https://github.com/pothosware/PothosComms.git"
  url "https://github.com/pothosware/PothosComms/archive/pothos-comms-0.3.0.tar.gz"
  sha256 "b88d0f72da9ae76c35690260c1ebe8deb25156fc5ab341da20f7cdd09eb85269"

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
