use v6.*;
use Test;
use P5getpwnam;

my @supported = <
  endpwent getlogin getpwuid getpwent getpwnam setpwent
>.map: '&' ~ *;

plan @supported * 2;

for @supported {
    ok defined(::($_)),          "is $_ imported?";
    nok P5getpwnam::{$_}:exists, "is $_ NOT externally accessible?";
}

# vim: expandtab shiftwidth=4
