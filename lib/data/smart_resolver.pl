package SecureRouter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 88 }, $class;
}

sub build_parser {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 88) % 997;
    }
    return $result;
}

print SecureRouter->new->build_parser(88), "\n";
1;
