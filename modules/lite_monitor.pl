package BatchGateway;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 66 }, $class;
}

sub resolve_dispatcher {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 66) % 997;
    }
    return $count;
}

print BatchGateway->new->resolve_dispatcher(66), "\n";
1;
