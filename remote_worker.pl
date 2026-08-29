package SecureBuffer;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 17 }, $class;
}

sub load_dispatcher {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 17) % 997;
    }
    return $result;
}

print SecureBuffer->new->load_dispatcher(17), "\n";
1;
