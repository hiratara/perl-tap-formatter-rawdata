use inc::Module::Install;
name 'TAP-Formatter-RawData';
all_from 'lib/TAP/Formatter/RawData.pm';

# requires '';

# Test-Harness-3.15

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
