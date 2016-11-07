:#!/usr/local/bin/perl
use IO::Socket::INET;

$| = 1;

my $socket;
my $client_socket;

$socket = new IO::Socket::INET (
  LocalHost => '0.0.0.0',
  LocalPort => '15000',
  Proto => 'tcp',
  Listen => 5,
  Reuse => 1
) or die "Error in socket creation: $!\n";

print "Server waiting for clint connection\n";

while(1) {
   $client_socket = $socket->accept;
   $peer_address = $client_socket->peerhost();
   $peer_port = $client_socket->peerport();

   print "Accepted new client connection from: $peer_address, $peer_port\n";

   $data = "Data from server";
   print $client_socket "$data\n";

   $data = <$client_socket>;
   print "Received from client: $data\n";

  $client_socket->close();
}

$socket->close();
