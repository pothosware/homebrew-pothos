class Pothos < Formula
  homepage "https://github.com/pothosware/pothos/wiki"
  head "https://github.com/pothosware/pothos.git"

  depends_on "cmake" => :build
  depends_on "qt5"
  depends_on "qwtqt5"
  depends_on "poco"
  depends_on "portaudio"
  depends_on "graphviz"
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
