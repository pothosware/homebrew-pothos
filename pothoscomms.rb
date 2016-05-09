class Pothoscomms < Formula
  desc "Pothos communications blocks"
  homepage "https://github.com/pothosware/pothos-comms/wiki"
  head "https://github.com/pothosware/pothos-comms.git"
  url "https://github.com/pothosware/pothos-comms/archive/pothos-comms-0.1.3.tar.gz"
  sha256 "150813c0af663f044f411e785a50b547cac070d8c227544ad230aaf96340d0f5"

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
