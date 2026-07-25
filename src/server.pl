use strict; use warnings; use IO::Socket::INET;
$| = 1;
my $port = 8791; my $root = $ARGV[0] || '.';
my $srv = IO::Socket::INET->new(LocalAddr=>'127.0.0.1', LocalPort=>$port, Listen=>20, Reuse=>1) or die "bind: $!";
print "SERVING $root on http://127.0.0.1:$port\n";
while (my $c = $srv->accept) {
  my $req = <$c>; while (my $h = <$c>) { last if $h =~ /^\r?\n$/; }
  if ($req && $req =~ m{GET\s+(\S+)\s}) {
    my $path = $1; $path =~ s/\?.*//; $path = '/index.html' if $path eq '/'; $path =~ s{\.\.}{}g;
    my $file = $root . $path;
    if (open my $fh, '<:raw', $file) { local $/; my $d = <$fh>; close $fh;
      my $ct = $path =~ /\.html$/ ? 'text/html; charset=utf-8' : 'application/octet-stream';
      print $c "HTTP/1.1 200 OK\r\nContent-Type: $ct\r\nContent-Length: ".length($d)."\r\nConnection: close\r\n\r\n$d";
    } else { print $c "HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\nConnection: close\r\n\r\n"; }
  }
  close $c;
}
