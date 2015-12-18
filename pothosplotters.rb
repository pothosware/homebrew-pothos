class Pothosplotters < Formula
  desc "Pothos graphical plotter widgets"
  homepage "https://github.com/pothosware/pothos-plotters/wiki"
  head "https://github.com/pothosware/pothos-plotters.git"

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
