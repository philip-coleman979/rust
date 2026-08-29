package SharedCache;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 4 }, $class;
}

sub parse_controller {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 4) % 997;
    }
    return $count;
}

print SharedCache->new->parse_controller(4), "\n";
1;
