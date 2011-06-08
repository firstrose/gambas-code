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

PhpDocGen::Generator::Html::Lang::French - A Language support for French

=head1 SYNOPSYS

use PhpDocGen::Generator::Html::Lang::French ;

my $gen = PhpDocGen::Generator::Html::Lang::French->new() ;

=head1 DESCRIPTION

PhpDocGen::Generator::Html::Lang::French is a Perl module, which proposes
a generic language support for French.

=head1 GETTING STARTED

=head2 Initialization

To start a generator script, say something like this:

    use PhpDocGen::Generator::Html::Lang::French;

    my $gen = PhpDocGen::Generator::Html::Lang::French->new() ;

...or something similar.

=head1 METHOD DESCRIPTIONS

This section contains only the methods in French.pm itself.

=over

=cut

package PhpDocGen::Generator::Html::Lang::French;

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
my %LANG_DEFS = ( 'I18N_LANG_ALL_CLASSES' => "Toutes les classes",
		  'I18N_LANG_ALL_CONSTANTS' => "Toutes les constantes",
		  'I18N_LANG_ALL_ELEMENTS' => "Tous les �lements",
		  'I18N_LANG_ALL_FUNCTIONS' => "Toutes les fonctions",
		  'I18N_LANG_ALL_VARIABLES' => "Toutes les variables",
		  'I18N_LANG_ALL_WEBPAGES' => "Toutes les pages Web",
		  'I18N_LANG_AUTHORS' => "Auteurs",

		  'I18N_LANG_BUGS' => "Bugs",

		  'I18N_LANG_CHANGELOGS' => "Changements",
		  'I18N_LANG_CLASS_LIST' => "Liste des classes",
		  'I18N_LANG_CLASS_HIERARCHY' => "Hi�rarchie des classes",
		  'I18N_LANG_CLASS_UPPER' => "Classe #1",
		  'I18N_LANG_CLASSES' => "Classes",
		  'I18N_LANG_CONSTANT_DETAIL' => "D�tail des constantes",
		  'I18N_LANG_CONSTANT_SUMMARY' => "R�sum� des constantes",
		  'I18N_LANG_CONSTANTS' => "Constantes",
		  'I18N_LANG_CONSTR' => "Constr",
		  'I18N_LANG_CONSTRUCTOR_DETAIL' => "D�tail du constructeur",
		  'I18N_LANG_CONSTRUCTOR_SUMMARY' => "R�sum� du constructeur",
		  'I18N_LANG_COPYRIGHT' => "Copyright",
		  'I18N_LANG_PHPDOCGEN_COPYRIGHT' => ( "Ce document a �t� g�n�r� par #1.<BR>\n".
						       "Copyright &copy; 2002-03 #2 (sous #3)" ),

		  'I18N_LANG_DATE' => "Date",
		  'I18N_LANG_DEFAULT_TITLE' => "Documentation de l'API PHP",
		  'I18N_LANG_DEPRECATED' => "Obsol�te",
		  'I18N_LANG_DIRECT_SUBCLASSES' => "Sous-classes directes connues",

		  'I18N_LANG_FIELD' => "Champs",
		  'I18N_LANG_FIELD_DETAIL' => "D�tail des champs",
		  'I18N_LANG_FIELD_SUMMARY' => "R�sum� des champs",
		  'I18N_LANG_FIXED' => "Fix�",
		  'I18N_LANG_FRAME_MESSAGE' => ( "Ce document a �t� con�u pou �tre vu " .
						 "avec des frames. Si vous voyez ce message, " .
						 "vous utilisez un navigateur ne supportant " .
						 "pas les frames.<BR>\n".
						 "Allez � la page #1.#2" ),
		  'I18N_LANG_FRAMES' => "Frames",
		  'I18N_LANG_FUNCTIONS' => "Fonctions",
		  'I18N_LANG_FUNCTION_DETAIL' => "D�tail des fonctions",
		  'I18N_LANG_FUNCTION_SUMMARY' => "R�sum� des fonctions",

		  'I18N_LANG_GLOBAL_VARS' => "Utilise les variables globales",

		  'I18N_LANG_INDEX' => "Index",
		  'I18N_LANG_INDEX_TYPE_ATTRIBUTE' => "attributs de la classe #1",
		  'I18N_LANG_INDEX_TYPE_CLASS' => "classe",
		  'I18N_LANG_INDEX_TYPE_CONSTANT' => "constantes d�finies dans le package #1",
		  'I18N_LANG_INDEX_TYPE_FUNCTION' => "fonctions d�finies dans le package #1",
		  'I18N_LANG_INDEX_TYPE_METHOD' => "m�thodes de la classe #1",
		  'I18N_LANG_INDEX_TYPE_VARIABLE' => "variables d�finie dans le package #1",
		  'I18N_LANG_INDEX_TYPE_WEBPAGE' => "page d�finie dans le module #1",
		  'I18N_LANG_INHERITED_METHODS' => "M�thodes h�rit�es de la classe #1 et non surcharg�es",

		  'I18N_LANG_METHOD' => "M�thode",
		  'I18N_LANG_METHOD_DETAIL' => "D�tail des m�thodes",
		  'I18N_LANG_METHOD_SUMMARY' => "R�sum� des m�thodes",
		  'I18N_LANG_MODULE' => "Module",

		  'I18N_LANG_NEXT' => "Suivant",
		  'I18N_LANG_NO_FRAME' => "Sans Frame",

		  'I18N_LANG_OVERVIEW' => "Vue d'ensemble",
		  'I18N_LANG_OVERVIEW_TITLE_PHP' => "Tous les �l�ments",
		  'I18N_LANG_OVERVIEW_TITLE_PHP_WEB' => "Tous les �l�ments PHP &amp; Web",
		  'I18N_LANG_OVERVIEW_TITLE_WEB' => "Tous les �l�ments Web",
		  'I18N_LANG_OVERVIEWTREE_TITLE_PHP' => "Hi�rarchie de toutes les classes",
		  'I18N_LANG_OVERVIEWTREE_TITLE_PHP_WEB' => "Hi�rarchie des classes &amp; des modules Web",
		  'I18N_LANG_OVERVIEWTREE_TITLE_WEB' => "Hi�rarchie de tous les modules Web",

		  'I18N_LANG_PACKAGE' => 'Package',
		  'I18N_LANG_PACKAGE_CONSTANTS' => "Constantes du package #1",
		  'I18N_LANG_PACKAGE_FUNCTIONS' => "Fonctions du package #1",
		  'I18N_LANG_PACKAGE_NAME' => "Package #1",
		  'I18N_LANG_PACKAGE_VARIABLES' => "Variables du package #1",
		  'I18N_LANG_PACKAGES' => "Packages",
		  'I18N_LANG_PAGES' => "Pages",
		  'I18N_LANG_PARAMETERS' => "Param�tres",
		  'I18N_LANG_PREV' => "Pr�c",

		  'I18N_LANG_RETURNS' => "Retourne",

		  'I18N_LANG_SEE_ALSO' => "Voir aussi",
		  'I18N_LANG_SINCE' => "Depuis",
		  'I18N_LANG_SOURCE' => "source",
		  'I18N_LANG_SOURCE_FILE' => "Fichier source #1",
		  'I18N_LANG_SUBMIT_BUG' => "Soumettre un bug",
		  'I18N_LANG_SUBMODULES' => "Sous-modules",

		  'I18N_LANG_TODO' => "&Agrave; faire",
		  'I18N_LANG_TREE' => "Arborescence",

		  'I18N_LANG_VARIABLE_DETAIL' => "D�tail des variables",
		  'I18N_LANG_VARIABLE_SUMMARY' => "R�sum� des variables",
		  'I18N_LANG_VARIABLES' => "Variables",
		  'I18N_LANG_VERSION' => "Version",

		  'I18N_LANG_WEB_ELEMENT_HIERARCHY' => "Hi�rarchie de tous les �l�ments Web",
		  'I18N_LANG_WEB_ELEMENT_LIST' => "Liste de tous les �l�ments Web",
		  'I18N_LANG_WEB_HIERARCHY' => "Hi�rarchie de tous les modules Web",
		  'I18N_LANG_WEBMODULE' => "Module Web #1",
		  'I18N_LANG_WEBMODULES' => "Modules Web",
		  'I18N_LANG_WEBPAGE' => "Page Web #1",
		) ;

#------------------------------------------------------
#
# Constructor
#
#------------------------------------------------------

sub new()  {
  my $proto = shift;
  my $class = ref($proto) || $proto;
  my $self = $class->SUPER::new("French",\%LANG_DEFS) ;
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
