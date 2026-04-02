# =============================================================================
# Latexmk Configuration for SELAR
# =============================================================================

# Use pdflatex to produce PDF directly
$pdf_mode = 1;

# Use biber for biblatex (not bibtex)
$biber = 'biber %O %S';

# pdflatex options — nonstopmode lets latexmk complete all passes
# (citations are undefined on pass 1 before biber; this is expected)
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';

# Tell latexmk to treat pdflatex return code 1 as non-fatal
# so biber and subsequent passes can run
$force_mode = 1;

# Clean up these extra extensions
$clean_ext = 'bbl bcf blg run.xml synctex.gz fdb_latexmk fls';

# Max repeat to resolve cross-references
$max_repeat = 5;
