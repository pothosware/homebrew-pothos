class Pothosgui < Formula
  desc "Pothos graphical design tool"
  homepage "https://github.com/pothosware/pothos-gui/wiki"
  head "https://github.com/pothosware/pothos-gui.git"
  url "https://github.com/pothosware/pothos-gui/archive/pothos-gui-0.3.0.tar.gz"
  sha256 "2b4f72ec816cf7a8024ad8d993cb2e1b45dd6834452f6cdbed3147c037968107"

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
