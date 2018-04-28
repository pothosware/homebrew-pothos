class Pothosflow < Formula
  desc "Pothos graphical design tool"
  homepage "https://github.com/pothosware/PothosFlow/wiki"
  head "https://github.com/pothosware/PothosFlow.git"
  url "https://github.com/pothosware/PothosFlow/archive/pothos-flow-0.6.1.tar.gz"
  sha256 "a397f4a524fd45e490b008fd2d998ce909b4b1ece2c61412cdc88e0bbe5002ea"

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
