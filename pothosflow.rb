class Pothosflow < Formula
  desc "Pothos graphical design tool"
  homepage "https://github.com/pothosware/PothosFlow/wiki"
  head "https://github.com/pothosware/PothosFlow.git"
  url "https://github.com/pothosware/PothosFlow/archive/pothos-gui-0.5.1.tar.gz"
  sha256 "d6f1ac3598a9a4e84544fdbe08635f3cff31df5d8aa48904c30175e0f93a9cfb"

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
