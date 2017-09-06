class Pothosplotters < Formula
  desc "Pothos graphical plotter widgets"
  homepage "https://github.com/pothosware/PothosPlotters/wiki"
  head "https://github.com/pothosware/PothosPlotters.git"
  url "https://github.com/pothosware/PothosPlotters/archive/pothos-plotters-0.3.1.tar.gz"
  sha256 "bbf4c015ce623a42261c0d5591f2f8b3a3f2be5416f6b7fee7ad4da8c3ff6b31"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "pothoscomms"
  depends_on "audiofilter/spuc/spuce"
  depends_on "qt5"

  #Qwt is used for the graphical plotter blocks.
  #Otherwise Pothos installs Qwt from submodule.
  #Although its preferable to use external qwt,
  #it requires a full xcode install to build.
  depends_on "qwtqt5" => :optional

  def install
    #clone internal qwt for tarballs only when qwtqt5 is not present
    if (build.without? "qwtqt5") and !(build.head?)
      system "git", "clone", "--branch", "tags/qwt-6.1.3", "https://github.com/osakared/qwt.git", "qwt6"
    end
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
