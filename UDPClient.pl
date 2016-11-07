:#!/usr/local/bin/perl
use IO::Socket::INET;

$| = 1;

my $socket;
my $data;

$socket = new IO::Socket::INET (
  PeerAddr => '10.4.0.80:15000',
  Proto => 'udp',
) or die "Error in socket creation: $!\n";

$data = "Data from server";
$socket->send($data);

$data = <$socket>;
print "Data received from socket: $data\n";

sleep(10);

$socket->close();
