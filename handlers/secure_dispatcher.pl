package LiteLoader;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 23 }, $class;
}

sub decode_dispatcher {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 23) % 997;
    }
    return $total;
}

print LiteLoader->new->decode_dispatcher(23), "\n";
1;
