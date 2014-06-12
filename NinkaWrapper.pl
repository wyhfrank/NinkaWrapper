#!/usr/bin/perl

use Spreadsheet::WriteExcel;

# Create a new Excel workbook
my $workbook = Spreadsheet::WriteExcel->new('result.xls');

# Add a worksheet
$worksheet = $workbook->add_worksheet();

$worksheet->freeze_panes(1, 0); # Freeze the first row

# Set the width of each column
$worksheet->set_column(0, 0,  20);
$worksheet->set_column(1, 1,  25);
$worksheet->set_column(2, 6,  5);
$worksheet->set_column(7, 7,  50);

$format = $workbook->add_format(); # Add a format
$format->set_bold();

# Set title
$worksheet->write(0, 0, 'File Name', $format);
$worksheet->write(0, 1, 'License', $format);

$row = 1;
@files = @ARGV;
foreach $file (@files) {

	$r = `ninka.pl -d $file`;
	@line=split(/;/, $r);

	$col=0;
	foreach $item (@line) {
		
		$worksheet->write($row, $col, $item);
		$col++;
	}
	$row++;
}

