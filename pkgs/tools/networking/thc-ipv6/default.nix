{ stdenv, fetchFromGitHub, libpcap, pkgconfig, openssl, libnetfilter_queue, libnfnetlink }:

stdenv.mkDerivation rec {
  pname = "thc-ipv6";
  version = "2020-02-21";

  src = fetchFromGitHub {
    owner = "vanhauser-thc";
    repo = "thc-ipv6";
    rev = "ba9fe25a7275748a82a1c3f31a98f5be0cde4d10";
    sha256 = "1lw5iwfn4n6d20slwddcky4qqkvl403fzkxv7m48hrm43rq0cbpx";
  };


  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ libpcap openssl libnetfilter_queue libnfnetlink ];

  makeFlags = [ "PREFIX=$(out)" ];


  meta = with stdenv.lib; {
    description = "IPv6 attack toolkit";
    homepage = https://github.com/vanhauser-thc/thc-ipv6;
    license = licenses.agpl3;
    maintainers = with maintainers; [ fadenb ];
    platforms = platforms.linux;
  };
}
