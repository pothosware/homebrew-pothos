class Pothosplotters < Formula
  desc "Pothos graphical plotter widgets"
  homepage "https://github.com/pothosware/pothos-plotters/wiki"
  head "https://github.com/pothosware/pothos-plotters.git"
  url "https://github.com/pothosware/pothos-plotters/archive/pothos-plotters-0.1.1.tar.gz"
  sha256 "dd13219d0985d54db5517b4a1e8a45551d3e0d54c913198366b4844e4a5938f4"

  depends_on "cmake" => :build
  depends_on "pothos"
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
      system "git", "clone", "--branch", "tags/qwt-6.1.2", "https://github.com/osakared/qwt.git", "qwt-6.1.2"
    end
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
