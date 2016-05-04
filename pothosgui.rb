class Pothosgui < Formula
  desc "Pothos graphical design tool"
  homepage "https://github.com/pothosware/pothos-gui/wiki"
  head "https://github.com/pothosware/pothos-gui.git"
  url "https://github.com/pothosware/pothos-gui/archive/pothos-gui-0.3.2.tar.gz"
  sha256 "d2550949bb3e090f4128ad6598044ed0f41849ada3e71ba732a5452dc426a496"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "qt5"

  #Graphviz optionally used by the GUI
  depends_on "graphviz" => :recommended

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
