class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/pothos-comms/wiki"
  head "https://github.com/pothosware/pothos-comms.git"
  url "https://github.com/pothosware/pothos-comms/archive/pothos-comms-0.2.0.tar.gz"
  sha256 "a4f9acaacb502200efa4cb89fa1e88e1448488b16378e84a63f50aa40f60c0c5"

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
