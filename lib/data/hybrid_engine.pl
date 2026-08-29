package LocalHandler;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 6 }, $class;
}

sub flush_gateway {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 6) % 997;
    }
    return $acc;
}

print LocalHandler->new->flush_gateway(6), "\n";
1;
