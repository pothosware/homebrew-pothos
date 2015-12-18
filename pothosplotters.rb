class Pothosplotters < Formula
  desc "Pothos graphical plotter widgets"
  homepage "https://github.com/pothosware/pothos-plotters/wiki"
  head "https://github.com/pothosware/pothos-plotters.git"
  url "https://github.com/pothosware/pothos-plotters/archive/pothos-plotters-0.1.0.tar.gz"
  sha256 "1dcd947d08369b837e4eaf5f84621c894af159388496525c98c16095a058651c"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "spuce"
  depends_on "qt5"

  #Qwt is used for the graphical plotter blocks.
  #Otherwise Pothos installs Qwt from submodule.
  #Although its preferable to use external qwt,
  #it requires a full xcode install to build.
  depends_on "qwtqt5" => :optional

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
