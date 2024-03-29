use strict;
use warnings;
use Test::More;

BEGIN {
    eval "use Sledge::TestPages";
    plan $@ ? (skip_all => 'needs Sledge::TestPages for testing') : (tests => 1);
}

package Mock::Pages;
use base qw/Sledge::TestPages/;
use Sledge::Plugin::URIWith;

sub dispatch_foo { }

package main;

$ENV{QUERY_STRING} = 'keyword=hoge&page=2';

my $d = $Mock::Pages::TMPL_PATH;
$Mock::Pages::TMPL_PATH = "t/template";

my $page = Mock::Pages->new;
$page->dispatch('foo');
like $page->output, qr[http://localhost/\?keyword=hoge&amp;page=3];
