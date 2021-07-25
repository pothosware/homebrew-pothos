class Pothosplotters < Formula
  desc "Pothos graphical plotter widgets"
  homepage "https://github.com/pothosware/PothosPlotters/wiki"
  head "https://github.com/pothosware/PothosPlotters.git"
  url "https://github.com/pothosware/PothosPlotters/archive/pothos-plotters-0.4.2.tar.gz"
  sha256 "b00806a8ef787346ca17e70abe21161862662b35f9eea12c6ce07bb47168eedd"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "pothoscomms"
  depends_on "audiofilter/spuc/spuce"
  depends_on "qt@5"
  depends_on "qwt"

  def install
    args = []

    #start path for qwt headers
    args += ["-DQWT_INCLUDE_DIR=/usr/local/lib/qwt.framework/Headers"]

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
