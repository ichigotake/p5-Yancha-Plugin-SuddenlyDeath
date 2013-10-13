package Yancha::Plugin::SuddenlyDeath;
use strict;
use warnings;
use utf8;
use Encode;
use Acme::SuddenlyDeath;

our $VERSION = '0.10';

sub setup {
    my ($class, $sys) = @_; 
    $sys->register_hook( 'before_send_post', sub {
      my ( $sys, $socket, $post, $ctx ) = @_; 
    
      my $cnt = scalar @{$post->{tags}};
      for (my$i=0; $i<$cnt; ++$i) {
        if ($post->{tags}->[$i] =~ m/^DEATH$/i) {
          delete $post->{tags}->[$i];
          $post->{text} = Encode::encode_utf8($post->{text});
          $post->{text} =~ s/#DEATH//ig;
          $post->{text} = decode_utf8(suddenly_death($post->{text}));
        }
      } 
      #use Data::Dumper; warn Dumper $post;

    } );

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

=head1 DESCRIPTION

yanchaで #DEATH タグをつけて発言をすると…

＿人人人人人＿
＞ 突然の死 ＜
￣^Y^Y^Y^Y^￣

=head2 AUTHOR

ichigotake

=head1 SEE ALSO

https://github.com/uzulla/yancha
