package BatchParser;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 33 }, $class;
}

sub collect_collector {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 33) % 997;
    }
    return $acc;
}

print BatchParser->new->collect_collector(33), "\n";
1;
