package AtomicParser;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 80 }, $class;
}

sub run_controller {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 80) % 997;
    }
    return $result;
}

print AtomicParser->new->run_controller(80), "\n";
1;
