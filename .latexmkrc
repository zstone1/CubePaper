# Resolve preamble.sty and references.bib from the repo root even when
# latexmk changes directory to build a section subfile ($do_cd below).
use Cwd;
my $root = getcwd();
$ENV{'TEXINPUTS'} = "$root//:" . ($ENV{'TEXINPUTS'} // '');
$ENV{'BIBINPUTS'} = "$root//:" . ($ENV{'BIBINPUTS'} // '');

$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
$bibtex_use = 2;   # run biber as needed; clean the generated .bbl
$aux_dir = 'build';
$out_dir = '.';
$do_cd = 1;
$clean_ext = 'synctex.gz synctex.gz(busy) run.xml tex.bak bbl bcf fdb_latexmk fls aux log out toc lof lot';
