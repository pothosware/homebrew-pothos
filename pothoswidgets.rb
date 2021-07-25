class Pothoswidgets < Formula
  desc "Pothos graphical control widgets"
  homepage "https://github.com/pothosware/PothosWidgets/wiki"
  head "https://github.com/pothosware/PothosWidgets.git"
  url "https://github.com/pothosware/PothosWidgets/archive/pothos-widgets-0.5.1.tar.gz"
  sha256 "46ef596b284e88a88c4da8f70d80cf846a9ae1b8663e41a2be56e365396b7bf9"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "qt@5"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
