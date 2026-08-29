package StreamGateway;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 14 }, $class;
}

sub encode_handler {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 14) % 997;
    }
    return $result;
}

print StreamGateway->new->encode_handler(14), "\n";
1;
