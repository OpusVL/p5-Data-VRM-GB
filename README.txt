=head1 NAME

Data::VRM::GB - Extract data about British vehicle registration marks

=head1 DESCRIPTION

This module allows you to get age information based on a vehicle registration
mark.

Note you should ignore the time portion of start_date and end_date in any
comparisons.  The end_date's time portion will be 00:00:00, so be very careful of
a fenceposting-like error here.

=head1 STATUS

Unstable - we haven't fully decided on the API and return data types yet.

=head1 SYNOPSIS

    use Data::VRM::GB qw/decode_vrm/;

    my $vd = decode_vrm('AB56 RST');
    $vd->{start_date};
    $vd->{end_date};

=head1 EXPORTS

=head1 SUPPORT


=head1 COPYRIGHT & LICENSE

Copyright (C) 2015 Opus Vision Limited

This is free software; you can redistribute it and/or modify it under the
same terms as the Perl 5 programming language system itself.

Telephone: C< +44 (0)1788 298 410 >

Email: C< community@opusvl.com >

