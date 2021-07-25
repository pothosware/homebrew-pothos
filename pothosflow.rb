class Pothosflow < Formula
  desc "Pothos graphical design tool"
  homepage "https://github.com/pothosware/PothosFlow/wiki"
  head "https://github.com/pothosware/PothosFlow.git"
  url "https://github.com/pothosware/PothosFlow/archive/pothos-flow-0.7.1.tar.gz"
  sha256 "fa3b130f8b9164f7f26bee645cc80f490dfda47bd5efe5242c5f5f3b1c202f87"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "qt@5"

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
