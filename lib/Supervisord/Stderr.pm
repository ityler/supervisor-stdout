package Supervisord::Stderr;
$Supervisord::Stderr::VERSION = '0.01';
use 5.010001;
use strict;
use warnings;

our $VERSION = '0.01';

sub listener {
  
  # Causes the currently selected handle to be flushed immediately and after every print.
  $| = 1; 
  
  while(1){
    
    # transition from ACKNOWLEDGED to READY
    print STDOUT "READY\n";
    
    my $x = <STDIN>;
    print STDERR $x."\n";

    # transition from READY to ACKNOWLEDGED
    print STDOUT "RESULT 2\nOK";

  }
}

1;
__END__

=head1 NAME

Supervisord::Stderr - a Perl supervisord event listener for dumping process state events to stderr.

=head1 SYNOPSIS

	One-liner approach within supervisord configuration file:
    ...
		[eventlistener:mylistener]
		command=perl -MSupervisord::Stderr -e 'Supervisord::Stderr::listener()'
		events=PROCESS_STATE
		...
	
=head1 DESCRIPTION

This module is for those using supervisord (  L<http://supervisord.org/> ) and would like access to the PROCESS_STATE of managed daemons.

Useful for debugging supervisor event listeners or for producing output that can be collected by a third party logging framework.

=head1 SEE ALSO

Supervisor - (  L<http://supervisord.org/> )

List of PROCESS_STATE event types - ( L<http://supervisord.org/events.html#process-state-event-type> )

Github - ( L<https://github.com/ityler/supervisord-stderr/> )

=head1 AUTHOR

Tyler Normile, E<lt>tylernormile@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

MIT License

Copyright (c) 2022 Tyler Normile

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

=cut
