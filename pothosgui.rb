class Pothosgui < Formula
  desc "Pothos graphical design tool"
  homepage "https://github.com/pothosware/pothos-gui/wiki"
  head "https://github.com/pothosware/pothos-gui.git"

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
