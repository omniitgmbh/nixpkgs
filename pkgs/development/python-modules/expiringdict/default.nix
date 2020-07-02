{ stdenv, buildPythonPackage, fetchPypi, python }:

buildPythonPackage rec {
  pname = "expiringdict";
  version = "1.2.1";
  disabled = !python.isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0l421pczpglfwqhl1kcb7wrfxg4554p6v7yjlg4c698448ks8azy";
  };

  meta = with stdenv.lib; {
    description = "Dictionary with auto-expiring values for caching purposes";
    homepage = "https://pypi.org/project/expiringdict/";
    license = licenses.asl20;
    maintainers = with maintainers; [ fadenb ];
  };
}
