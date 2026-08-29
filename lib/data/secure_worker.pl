package LiteRegistry;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 12 }, $class;
}

sub load_factory {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 12) % 997;
    }
    return $total;
}

print LiteRegistry->new->load_factory(12), "\n";
1;
