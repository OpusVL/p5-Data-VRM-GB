use Test::Most tests => 17;

use DateTime;
use Data::VRM::GB qw/decode_vrm/;

# Current Style Marks

is(decode_vrm('AA51 AAA')->{start_date}, DateTime->new(year => 2001, month => 9, day => 1), 'AA51 AAA start_date');
is(decode_vrm('AA51 AAA')->{end_date}, DateTime->new(year => 2002, month => 2, day => 28), 'AA51 AAA end_date');


is(decode_vrm('AA02 AAA')->{start_date}, DateTime->new(year => 2002, month => 3, day => 1), 'AA02 AAA start_date');
is(decode_vrm('AA02 AAA')->{end_date}, DateTime->new(year => 2002, month => 8, day => 31), 'AA02 AAA end_date');


is(decode_vrm('AA14 AAA')->{start_date}, DateTime->new(year => 2014, month => 3, day => 1), 'AA14 AAA start_date');
is(decode_vrm('AA14 AAA')->{end_date}, DateTime->new(year => 2014, month => 8, day => 31), 'AA14 AAA end_date');


is(decode_vrm('AA65 AAA')->{start_date}, DateTime->new(year => 2015, month => 9, day => 1), 'AA65 AAA start_date');
is(decode_vrm('AA65 AAA')->{end_date}, DateTime->new(year => 2016, month => 2, day => 29), 'AA65 AAA end_date');

is(decode_vrm('AA67 AAA')->{start_date}, DateTime->new(year => 2017, month => 9, day => 1), 'AA67 AAA start_date');
is(decode_vrm('AA67 AAA')->{end_date}, DateTime->new(year => 2018, month => 2, day => 28), 'AA67 AAA end_date');

# TODO Will there ever be an 00, 50 or 01 plate?  What will it be if so?


# Year-prefix Marks

ok(defined decode_vrm('A1 AAA'), 'A1 AAA should be defined');
is(decode_vrm('A1 AAA')->{start_date}, DateTime->new(year => 1983, month => 8, day => 1), 'A1 AAA start_date');
is(decode_vrm('A1 AAA')->{end_date}, DateTime->new(year => 1984, month => 7, day => 31), 'A1 AAA end_date');

is(decode_vrm('Y123 AYX')->{start_date}, DateTime->new(year => 2001, month => 3, day => 1), 'Y123 AYX start_date');
is(decode_vrm('Y123 AYX')->{end_date}, DateTime->new(year => 2001, month => 8, day => 31), 'Y123 AYX end_date');

ok( ! defined decode_vrm('I2 AAA'), 'I2 AAA should be undef because no "I" prefix plates were issued');

# Test handling of unknown formats
ok( ! defined decode_vrm('RUBB ISH'), 'Passing in RUBB ISH should return undef');
