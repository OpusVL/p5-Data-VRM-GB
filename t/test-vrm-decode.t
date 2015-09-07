use Test::Most tests => 11;

use DateTime;
use Data::VRM::GB qw/decode_vrm/;

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


ok( ! defined decode_vrm('RUBB ISH'), 'Passing in RUBB ISH should return undef');
