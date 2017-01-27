class Pothosgui < Formula
  desc "Pothos graphical design tool"
  homepage "https://github.com/pothosware/pothos-gui/wiki"
  head "https://github.com/pothosware/pothos-gui.git"
  url "https://github.com/pothosware/pothos-gui/archive/pothos-gui-0.4.3.tar.gz"
  sha256 "3ce0527bd19e6a051505076fd0379ca69709aa8731d5a0861153dc6b5d969b46"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "qt5"

  #Graphviz optionally used by the GUI
  depends_on "graphviz" => :recommended

  def install

    args = []

    #use the install prefix bundle destination
    #so brew linkapps can automatically see it
    args += ["-DBUNDLE_DESTINATION=."]

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
