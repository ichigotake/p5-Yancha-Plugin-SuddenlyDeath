package Yancha::Plugin::SuddenlyDeath;
use strict;
use warnings;
use Acme::SuddenlyDeath;

sub setup {
    my ($class, $sys) = @_; 
}

1;
__DATA__

=head1 NAME

Yancha::Plugin::SuddenlyDeath - SuddenlyDeath for Yancha plugin.

=head1 SYNOPSIS

    # add config.pl
    'plugins' => [
        [ 'Yancha::Plugin::SuddenlyDeath' ],
    ...


=head2 AUTHOR

mackee_w

=head1 SEE ALSO

Acme::SuddenlyDeath

https://github.com/uzulla/yancha

