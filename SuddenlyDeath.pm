package Yancha::Plugin::SuddenlyDeath;
use strict;
use warnings;
use Acme::SuddenlyDeath;

sub setup {
    my ($class, $sys) = @_;
    $sys->register_hook( 'before_send_post', sub {
      my ( $sys, $socket, $post, $ctx ) = @_; 
    
      my $cnt = scalar @{$post->{tags}};
      for (my$i=0; $i<$cnt; ++$i) {
        if ($post->{tags}->[$i] eq 'DEATH') {
          delete $post->{tags}->[$i];
          utf8::encode($post->{text}) if utf8::is_utf8($post->{text});
          $post->{text} =~ s/#DEATH//g;
          $post->{text} = decoration = suddenly_death($post->{text});
          #$post->{text} .= "\n#PUBLIC";
        }   
      }   
      $post->{tags} = ['PUBLIC'] unless @{$post->{tags}};
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

I< #DEATH >とタグをつけると

＿人人人人人人＿
＞ 突然の死 ＜
￣^Y^Y^Y^Y^Y^￣

=head1 AUTHOR

mackee_w

=head1 SEE ALSO

Acme::SuddenlyDeath

https://github.com/uzulla/yancha

