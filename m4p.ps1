# vim: set et tw=0:

# Joseph Harriott http://momentary.eu/  Fri 24 Aug 2018
# Convert a single markdown file to pdf nicely.
# -----------------------------------------------------

param( [string]$md=$(throw "$PSCommandPath requires an md file"), [switch]$noToC )

$mdfbn=$md -replace '\.md$','' # get md file basename
$mdf=$mdfbn + ".md"
if (test-path "$mdf") {
    # set the Pandoc ToC switches (the default case) if no 2nd argument was given:
    if (!$noToC) {$ToC="--toc --toc-depth=5"}

    "running pandoc on $mdf"
    PowerShell -NoProfile "$PSScriptRoot\md4pdf.ps1 $mdfbn $toc"
}else{
    Write-Host "$PSCommandPath : file " -foregroundcolor red -backgroundcolor white -nonewline;
    Write-Host "$mdf" -foregroundcolor red -backgroundcolor yellow -nonewline;
    Write-Host " ain't there" -foregroundcolor red -backgroundcolor white
}

ri tex2pdf.????* # remove trailing work folders
