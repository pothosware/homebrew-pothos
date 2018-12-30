class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/PothosComms/wiki"
  head "https://github.com/pothosware/PothosComms.git"
  url "https://github.com/pothosware/PothosComms/archive/pothos-comms-0.3.2.tar.gz"
  sha256 "c255db5c679b3fd65498296508720c6a5b70b0c93c1180870933d4133075393c"

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
