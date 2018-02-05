class Opensfm < Formula
  include Language::Python::Virtualenv

  desc "Open source Structure from Motion pipeline"
  homepage "https://github.com/mapillary/OpenSfM"
  url "https://github.com/mapillary/OpenSfM/archive/06fe01c828bd9b8d25659644e3bf0cca560a0820.zip" # TODO: use release.tar.gz
  version "0.2-mabrowning" # Update this when new release is posted
  sha256 "e96ce55c7075f41ed6e998d1cb562f725f8b1b1131a3f94c20c82d97eb88dce1"

  depends_on "numpy"
  depends_on "scipy"
  depends_on "opencv"
  depends_on "ceres-solver"
  depends_on "eigen"
  depends_on "boost-python"
  depends_on "cmake" => :build

  resource "OpenGV" do
    url "https://github.com/paulinus/opengv/archive/503e5cebc9c361f1d2af79eeb8bed8eefb15cec4.zip" # TODO: use release.tar.gz
    sha256 "0022dc9860a462b20e0e79520efe7a55fd4fdf759dc23c129fd844378439a77e"
  end

  resource "cloudpickle" do
    url "https://files.pythonhosted.org/packages/82/15/7cb15c1d0cb65ccd90510ba52e3013dad02afdd276fc20a7cd8d345e0e5e/cloudpickle-0.4.0.tar.gz"
    sha256 "5bb83eb466f0733dbd077e76cf1a15c404a94eb063cecc7049a1482fa1b11661"
  end

  resource "decorator" do
    url "https://files.pythonhosted.org/packages/70/f1/cb9373195639db13063f55eb06116310ad691e1fd125e6af057734dc44ea/decorator-4.2.1.tar.gz"
    sha256 "7d46dd9f3ea1cf5f06ee0e4e1277ae618cf48dfb10ada7c8427cd46c42702a0e"
  end

  resource "ExifRead" do
    url "https://files.pythonhosted.org/packages/7b/cb/92b644626830115910cf2b36d3dfa600adbec86dff3207a7de3bfd6c6a60/ExifRead-2.1.2.tar.gz"
    sha256 "79e244f2eb466709029e8806fe5e2cdd557870c3db5f68954db0ef548d9320ad"
  end

  resource "gpxpy" do
    url "https://files.pythonhosted.org/packages/51/3c/29004507bc4d5c1248a1a37ec01c2030b2e977609c219244d81f3041b745/gpxpy-1.1.2.tar.gz"
    sha256 "c46b8fe738c6402638d2b5434020bc6ccd24b15090d7234fe9b158fdea14f354"
  end

  resource "loky" do
    url "https://files.pythonhosted.org/packages/57/60/4ac374cfaf3cb1f238f9366d62fd214c1ab06113f7c68bd27d59384da313/loky-1.2.1.tar.gz"
    sha256 "9055b21ef326a4310fa4b90bcfdc17dc633dbbbb8501c489e4613775fe6ab8c1"
  end

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/c2/93/dbb41b03cf7c878a7409c8e92226531f840a423c9309ea534873a83c9192/networkx-1.11.tar.gz"
    sha256 "0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8"
  end

  resource "py" do
    url "https://files.pythonhosted.org/packages/90/e3/e075127d39d35f09a500ebb4a90afd10f9ef0a1d28a6d09abeec0e444fdd/py-1.5.2.tar.gz"
    sha256 "ca18943e28235417756316bfada6cd96b23ce60dd532642690dcfdaba988a76d"
  end

  resource "pyproj" do
    url "https://files.pythonhosted.org/packages/29/72/5c1888c4948a0c7b736d10e0f0f69966e7c0874a660222ed0a2c2c6daa9f/pyproj-1.9.5.1.tar.gz"
    sha256 "53fa54c8fa8a1dfcd6af4bf09ce1aae5d4d949da63b90570ac5ec849efaf3ea8"
  end

  resource "pytest" do
    url "https://files.pythonhosted.org/packages/00/e9/f77dcd80bdb2e52760f38dbd904016da018ab4373898945da744e5e892e9/pytest-3.0.7.tar.gz"
    sha256 "b70696ebd1a5e6b627e7e3ac1365a4bc60aaf3495e843c1e70448966c5224cab"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6/python-dateutil-2.6.0.tar.gz"
    sha256 "62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"
    sha256 "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "xmltodict" do
    url "https://files.pythonhosted.org/packages/4a/5e/cd36c16c9eca47162fbbea9aa723b9ab3010f9ae9d4be5c9f6cb2bc147ab/xmltodict-0.10.2.tar.gz"
    sha256 "fc518ccf9adbbb917a2ddcb386be852ae6dd36935e1e8b9a3e760201abfdbf77"
  end

  def install
    venv = virtualenv_create(libexec)
    %w[cloudpickle decorator ExifRead gpxpy loky networkx py pyproj pytest python-dateutil PyYAML six xmltodict].each do |r|
      venv.pip_install resource(r)
    end
    resource("OpenGV").stage do
      system "cmake", ".", *std_cmake_args,
        "-DCMAKE_INSTALL_PREFIX:PATH="+libexec,
        "-DBUILD_TESTS=OFF",
        "-DBUILD_PYTHON=ON"
      system "make", "install"
    end
    venv.pip_install_and_link buildpath
  end

  test do
    false # TODO: write some tests
  end
end
