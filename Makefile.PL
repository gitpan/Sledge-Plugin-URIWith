use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'         => 'Sledge::Plugin::URIWith',
    'VERSION_FROM' => 'lib/Sledge/Plugin/URIWith.pm', # finds $VERSION
    'PREREQ_PM'    => {
        Test::More => 0.32,
        Carp       => 1.02,
        URI        => 1.35,
    },
);
