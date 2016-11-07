:#!/usr/local/bin/perl
use IO::Socket::INET;

$| = 1;

my $socket;
my $client_socket;
my $peer_address;
my $peer_port;

$socket = new IO::Socket::INET (
  LocalPort => '15000',
  Proto => 'udp',
) or die "Error in socket creation: $!\n";

print "Server waiting for clint connection\n";

while(1) {
  $socket->recv($received_data,1024);
  $peer_address = $socket->peerhost();
  $peer_port = $socket->peerport();

  print "\n$peer_address, $peer_port said: $received_data\n";

  $data = "Data from server";
  print $socket "$data\n";
}

$socket->close();
