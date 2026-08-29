package BatchAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 30 }, $class;
}

sub sync_client {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 30) % 997;
    }
    return $count;
}

print BatchAdapter->new->sync_client(30), "\n";
1;
