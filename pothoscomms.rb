class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/pothos-comms/wiki"
  head "https://github.com/pothosware/pothos-comms.git"
  url "https://github.com/pothosware/pothos-comms/archive/pothos-comms-0.2.2.tar.gz"
  sha256 "db8081d9e40256b9eb0c6ff4ef8d64d782d93f5381c76e67b9e40c78996113f2"

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
