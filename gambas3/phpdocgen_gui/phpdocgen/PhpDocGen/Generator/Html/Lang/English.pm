# Copyright (C) 2002-03  Stephane Galland <galland@arakhne.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.

=pod

=head1 NAME

PhpDocGen::Generator::Html::Lang::English - A Language support for English

=head1 SYNOPSYS

use PhpDocGen::Generator::Html::Lang::English ;

my $gen = PhpDocGen::Generator::Html::Lang::English->new() ;

=head1 DESCRIPTION

PhpDocGen::Generator::Html::Lang::English is a Perl module, which proposes
a generic language support for English.

=head1 GETTING STARTED

=head2 Initialization

To start a generator script, say something like this:

    use PhpDocGen::Generator::Html::Lang::English;

    my $gen = PhpDocGen::Generator::Html::Lang::English->new() ;

...or something similar.

=head1 METHOD DESCRIPTIONS

This section contains only the methods in English.pm itself.

=over

=cut

package PhpDocGen::Generator::Html::Lang::English;

@ISA = ('PhpDocGen::Generator::Lang');
@EXPORT = qw();
@EXPORT_OK = qw();

use strict;
use vars qw(@ISA @EXPORT @EXPORT_OK $VERSION);
use Exporter;

use PhpDocGen::Generator::Lang ;

#------------------------------------------------------
#
# Global vars
#
#------------------------------------------------------

# Version number of language support
my $VERSION = "0.1" ;

# Language definitions
my %LANG_DEFS = ( 'I18N_LANG_ALL_CLASSES' => "All Classes",
		  'I18N_LANG_ALL_CONSTANTS' => "All Constants",
		  'I18N_LANG_ALL_ELEMENTS' => "All Elements",
		  'I18N_LANG_ALL_FUNCTIONS' => "All Functions",
		  'I18N_LANG_ALL_VARIABLES' => "All Variables",
		  'I18N_LANG_ALL_WEBPAGES' => "All Web Pages",
		  'I18N_LANG_AUTHORS' => "Authors",

		  'I18N_LANG_BUGS' => "Bugs",

		  'I18N_LANG_CHANGELOGS' => "Change logs",
		  'I18N_LANG_CLASS_LIST' => "List of the Classes",
		  'I18N_LANG_CLASS_HIERARCHY' => "Class Hierarchy",
		  'I18N_LANG_CLASS_UPPER' => "Class #1",
		  'I18N_LANG_CLASSES' => "Classes",
		  'I18N_LANG_CONSTANT_DETAIL' => "Constant Detail",
		  'I18N_LANG_CONSTANT_SUMMARY' => "Constant Summary",
		  'I18N_LANG_CONSTANTS' => "Constants",
		  'I18N_LANG_CONSTR' => "Constr",
		  'I18N_LANG_CONSTRUCTOR_DETAIL' => "Constructor Detail",
		  'I18N_LANG_CONSTRUCTOR_SUMMARY' => "Constructor Summary",
		  'I18N_LANG_COPYRIGHT' => "Copyright",
		  'I18N_LANG_PHPDOCGEN_COPYRIGHT' => ( "This document was generated by #1.<BR>\n".
						       "Copyright &copy; 2002-03 #2 (under the #3)" ),

		  'I18N_LANG_DATE' => "Date",
		  'I18N_LANG_DEFAULT_TITLE' => "Documentation of the PHP API",
		  'I18N_LANG_DEPRECATED' => "Deprecated",
		  'I18N_LANG_DIRECT_SUBCLASSES' => "Direct Known Subclasses",

		  'I18N_LANG_FIELD' => "Field",
		  'I18N_LANG_FIELD_DETAIL' => "Field Detail",
		  'I18N_LANG_FIELD_SUMMARY' => "Field Summary",
		  'I18N_LANG_FIXED' => "Fixed",
		  'I18N_LANG_FRAME_MESSAGE' => ( "This document is designed to be " .
						 "viewed using the frames " .
						 "feature. If you see this message, " .
						 "you are using a " .
						 "non-frame-capable web client.<BR>\n" .
						 "Link to #1.#2" ),
		  'I18N_LANG_FRAMES' => "Frames",
		  'I18N_LANG_FUNCTIONS' => "Functions",
		  'I18N_LANG_FUNCTION_DETAIL' => "Function Detail",
		  'I18N_LANG_FUNCTION_SUMMARY' => "Function Summary",

		  'I18N_LANG_GLOBAL_VARS' => "Uses the global variables",

		  'I18N_LANG_INDEX' => "Index",
		  'I18N_LANG_INDEX_TYPE_ATTRIBUTE' => "attribute of the class #1",
		  'I18N_LANG_INDEX_TYPE_CLASS' => "class",
		  'I18N_LANG_INDEX_TYPE_CONSTANT' => "constant defined inside the package #1",
		  'I18N_LANG_INDEX_TYPE_FUNCTION' => "function defined inside the package #1",
		  'I18N_LANG_INDEX_TYPE_METHOD' => "method of the class #1",
		  'I18N_LANG_INDEX_TYPE_VARIABLE' => "variable defined inside the package #1",
		  'I18N_LANG_INDEX_TYPE_WEBPAGE' => "page defined inside the module #1",
		  'I18N_LANG_INHERITED_METHODS' => "Methods inherited from class #1 and not overridden",

		  'I18N_LANG_METHOD' => "Method",
		  'I18N_LANG_METHOD_DETAIL' => "Method Detail",
		  'I18N_LANG_METHOD_SUMMARY' => "Method Summary",
		  'I18N_LANG_MODULE' => "Module",

		  'I18N_LANG_NEXT' => "Next",
		  'I18N_LANG_NO_FRAME' => "No Frame",

		  'I18N_LANG_OVERVIEW' => "Overview",
		  'I18N_LANG_OVERVIEW_TITLE_PHP' => "All Elements",
		  'I18N_LANG_OVERVIEW_TITLE_PHP_WEB' => "All PHP Elements &amp; Web Elements",
		  'I18N_LANG_OVERVIEW_TITLE_WEB' => "All Web Elements",
		  'I18N_LANG_OVERVIEWTREE_TITLE_PHP' => "Hierarchy For All Classes",
		  'I18N_LANG_OVERVIEWTREE_TITLE_PHP_WEB' => "Hierarchy For All Classes &amp; Web Modules",
		  'I18N_LANG_OVERVIEWTREE_TITLE_WEB' => "Hierarchy For All Web Modules",

		  'I18N_LANG_PACKAGE' => 'Package',
		  'I18N_LANG_PACKAGE_CONSTANTS' => "Constants for the Package #1",
		  'I18N_LANG_PACKAGE_FUNCTIONS' => "Functions for the Package #1",
		  'I18N_LANG_PACKAGE_NAME' => "Package #1",
		  'I18N_LANG_PACKAGE_VARIABLES' => "Variables for the Package #1",
		  'I18N_LANG_PACKAGES' => "Packages",
		  'I18N_LANG_PAGES' => "Pages",
		  'I18N_LANG_PARAMETERS' => "Parameters",
		  'I18N_LANG_PREV' => "Prev",

		  'I18N_LANG_RETURNS' => "Returns",

		  'I18N_LANG_SEE_ALSO' => "See also",
		  'I18N_LANG_SINCE' => "Since",
		  'I18N_LANG_SOURCE' => "source",
		  'I18N_LANG_SOURCE_FILE' => "Source file #1",
		  'I18N_LANG_SUBMIT_BUG' => "Submit a bug",
		  'I18N_LANG_SUBMODULES' => "Submodules",

		  'I18N_LANG_TODO' => "To Do",
		  'I18N_LANG_TREE' => "Tree",

		  'I18N_LANG_VARIABLE_DETAIL' => "Variable Detail",
		  'I18N_LANG_VARIABLE_SUMMARY' => "Variable Summary",
		  'I18N_LANG_VARIABLES' => "Variables",
		  'I18N_LANG_VERSION' => "Version",

		  'I18N_LANG_WEB_ELEMENT_HIERARCHY' => "Hierarchy for all Web Elements",
		  'I18N_LANG_WEB_ELEMENT_LIST' => "List of Web Elements",
		  'I18N_LANG_WEB_HIERARCHY' => "Hierarchy for all Web Modules",
		  'I18N_LANG_WEBMODULE' => "Webmodule #1",
		  'I18N_LANG_WEBMODULES' => "Web Modules",
		  'I18N_LANG_WEBPAGE' => "Webpage #1",
		) ;

#------------------------------------------------------
#
# Constructor
#
#------------------------------------------------------

sub new()  {
  my $proto = shift;
  my $class = ref($proto) || $proto;
  my $self = $class->SUPER::new("English",\%LANG_DEFS) ;
  bless( $self, $class );
  return $self;
}

1;
__END__

=back

=head1 COPYRIGHT

(c) Copyright 2002-03 St�phane Galland <galland@arakhne.org>, under GPL.

=head1 AUTHORS

=over

=item *

Conceived and initially developed by St�phane Galland E<lt>galland@arakhne.orgE<gt>.

=back

=head1 SEE ALSO

phpdocgen.pl
