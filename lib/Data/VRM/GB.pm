package Data::VRM::GB;

use strict;
use warnings;
use Exporter::Easy (
    OK => [ qw/decode_vrm/ ],
);

our $VERSION = '0.01';

sub _normalise_vrm($) {
    my ($vrm) = @_;
    $vrm =~ s/\s//g;
    $vrm =~ tr/a-z/A-Z/;
    return $vrm;
}

sub decode_vrm($) {
    my ($vrm) = @_;
    my $start_date;
    my $end_date;
    $vrm = _normalise_vrm($vrm);
    if ($vrm =~ /^[A-Z]{2}([0-9]{2})[A-Z]{3}$/) {
        my ($start_year, $start_month) = _split_age_numbers($1);
        $start_date = DateTime->new(year => $start_year, month => $start_month, day => 1);
        my $e = $start_date->clone->add(months => 5);
        $end_date = DateTime->last_day_of_month(year => $e->year, month => $e->month);
    }
    else {
        # No patterns matched, can't parse this type of VRM
        return undef;
    }
    return {
        start_date => $start_date,
        end_date => $end_date,
    };
}

sub _split_age_numbers($) {
    my ($age_pair) = @_;
    my ($month_id, $year_id) = split(//, $age_pair);
    my $year_tens = ($month_id < 5) ? $month_id : ($month_id - 5);
    my $year_units = $year_id;
    my $start_year = 2000 + ($year_tens * 10) + $year_units;
    my $start_month = ($month_id < 5) ? 3 : 9;
    return ($start_year, $start_month);
}

1;

=head1 NAME

Data::VRM::GB - Extract data about British vehicle registration marks

=head1 DESCRIPTION

This module allows you to get age information based on a vehicle registration
mark.

Note you should ignore the time portion of start_date and end_date in any
comparisons.  The end_date's time portion will be 00:00:00, so be very careful of
a fenceposting-like error here.

=head1 SYNOPSIS

    use Data::VRM::GB qw/decode_vrm/;

    my $vd = vrm_data('AB56 RST');
    $vd->{start_date};
    $vd->{end_date};

=head1 EXPORTS

=head1 COPYRIGHT & LICENSE

Copyright (C) 2015 Opus Vision Limited

This is free software; you can redistribute it and/or modify it under the
same terms as the Perl 5 programming language system itself.

=cut

