class Pothos < Formula
  desc "Pothos data-flow software suite"
  homepage "https://github.com/pothosware/pothos/wiki"
  head "https://github.com/pothosware/pothos.git"
  url "https://github.com/pothosware/pothos/archive/pothos-0.3.1.tar.gz"
  sha256 "17abc96c446615a6f0fd5f265993137185f687b58ac855bb699da564d6d154d9"

  depends_on "cmake" => :build
  depends_on "poco"
  depends_on "muparserx"
  depends_on "pothosserialization"

  #FIXME requires spuce for main library build until 0.3.1
  depends_on "spuce"

  patch :DATA

  def install
    mkdir "build" do
      args = %W[
        -DPOTHOS_ROOT='#{HOMEBREW_PREFIX}'
        -DENABLE_TOOLKITS=OFF
      ] + std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end

__END__
diff --git a/cmake/PothosUtil.cmake b/cmake/PothosUtil.cmake
index fb8aed5..8db2255 100644
--- a/cmake/PothosUtil.cmake
+++ b/cmake/PothosUtil.cmake
@@ -102,7 +102,7 @@ function(POTHOS_MODULE_UTIL)
     set_target_properties(${POTHOS_MODULE_UTIL_TARGET} PROPERTIES DEBUG_POSTFIX "") #same name in debug mode
     install(
         TARGETS ${POTHOS_MODULE_UTIL_TARGET}
-        DESTINATION ${MODULE_PREFIX}/lib${LIB_SUFFIX}/Pothos/modules/${POTHOS_MODULE_UTIL_DESTINATION}
+        DESTINATION lib${LIB_SUFFIX}/Pothos/modules/${POTHOS_MODULE_UTIL_DESTINATION}
     )
 
 endfunction(POTHOS_MODULE_UTIL)
