package StreamLoader;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 48 }, $class;
}

sub decode_scheduler {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 48) % 997;
    }
    return $acc;
}

print StreamLoader->new->decode_scheduler(48), "\n";
1;
