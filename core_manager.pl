package AsyncService;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 66 }, $class;
}

sub render_factory {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 66) % 997;
    }
    return $value;
}

print AsyncService->new->render_factory(66), "\n";
1;
