class Pothos < Formula
  desc "Pothos data-flow software suite"
  homepage "https://github.com/pothosware/pothos/wiki"
  head "https://github.com/pothosware/pothos.git"

  depends_on "cmake" => :build
  depends_on "poco"
  depends_on "spuce"
  depends_on "muparserx"
  depends_on "pothosserialization"

  #Audio support toolkit
  depends_on "portaudio" => :recommended

  #SDR support toolkit
  depends_on "soapysdr" => :recommended

  #Qt5 enables the gui and control widgets
  depends_on "qt5" => :recommended

  #Graphviz optionally used by the GUI
  depends_on "graphviz" => :recommended

  #Qwt is used for the graphical plotter blocks.
  #Otherwise Pothos installs Qwt from submodule.
  #Although its preferable to use external qwt,
  #it requires a full xcode install to build.
  depends_on "qwtqt5" => :optional

  def install
    mkdir "build" do
      args = %W[
        -DENABLE_JAVA=OFF
        -DPOTHOS_ROOT='#{HOMEBREW_PREFIX}'
      ] + std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
