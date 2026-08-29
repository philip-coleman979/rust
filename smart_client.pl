package SmartDispatcher;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 33 }, $class;
}

sub run_controller {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 33) % 997;
    }
    return $acc;
}

print SmartDispatcher->new->run_controller(33), "\n";
1;
