<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Cell\DataType;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use App\User;
use App\Staff;
use App\Issue;
use App\Archive;
use DB;
use App\Traits\AddSystemLogs;

class ReportController extends Controller
{
    use AddSystemLogs;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function generatereport_monthly(Request $request) {
        ini_set('max_execution_time', '600');
        $this->addsystemlogs('Generate monthly report');
			
        $myMonth = date('F', mktime(0, 0, 0, $request->month, 10));

        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->setTitle(substr($myMonth, 0, 3));

        $sheet->setCellValue('A8', 'Finance and Administrative Division');
        $sheet->setCellValue('A9', 'ICT Unit - Technical Support Summary');
        $sheet->setCellValue('A10', 'For the month of ' . $myMonth . ' ' . $request->year);

        $spreadsheet->getActiveSheet()->mergeCells('A8:M8');
        $spreadsheet->getActiveSheet()->mergeCells('A9:M9');
        $spreadsheet->getActiveSheet()->mergeCells('A10:M10');
        $spreadsheet->getActiveSheet()->getStyle('A8:M10')->getAlignment()->setHorizontal('center');

        $sheet->setCellValue('A12', 'Reference Number');
        $sheet->setCellValue('B12', 'Date');
        $sheet->setCellValue('C12', 'Name');
        $sheet->setCellValue('D12', 'Position');
        $sheet->setCellValue('E12', 'Office/Staff');
        $sheet->setCellValue('F12', 'Level of Priority ');
        $sheet->setCellValue('G12', 'ICT Issue or Problem');
        $sheet->setCellValue('H12', 'ICT Issue /Handled by:');
        $sheet->setCellValue('I12', 'Start of Action');
        $sheet->setCellValue('J12', 'End of Action');
        $sheet->setCellValue('K12', 'Report/Description of Specific Work');
        $sheet->setCellValue('L12', 'ICT Technical Support Personnel');
        $sheet->setCellValue('M12', 'Acceptance Rating');

        $row_ctr = 13;
        $date = $request->year . '-' . str_pad($request->month, 2, '0', STR_PAD_LEFT) . '-';

        $issues = Issue::where('created_at', 'LIKE', "{$date}%")->where('reff_no', 'NOT LIKE', 'TEMP-%')->where('status', '!=', 6)->get();
        $archives = Archive::where('created_at', 'LIKE', "{$date}%")->where('reff_no', 'NOT LIKE', 'TEMP-%')->where('status', '!=', 6)->get();

        foreach($issues->merge($archives)->all() as $issue) {
        // $date = date('Y-m-');
        // foreach(Issue::where('created_at', 'LIKE', "{$date}%")->where('reff_no', 'NOT LIKE', 'TEMP-%')->where('status', '!=', 6)->get() as $issue) {
            $sheet->setCellValue('A' . $row_ctr, $issue->reff_no);
            $sheet->setCellValue('B' . $row_ctr, $issue->created_at->format('m/d/Y'));
            $sheet->setCellValue('C' . $row_ctr, $issue->user->name);

            // dump($issue->user->position_id);
            $sheet->setCellValue('D' . $row_ctr, $issue->user->position->name);
            $sheet->setCellValue('E' . $row_ctr, $issue->user->mstaff->abbreviation);
            $sheet->setCellValue('F' . $row_ctr, $issue->prioritydesc());
            $sheet->setCellValue('G' . $row_ctr, $issue->category->name);
            $sheet->setCellValue('H' . $row_ctr, $issue->resolver_id == null ? '' : $issue->resolver->name);
            $sheet->setCellValue('I' . $row_ctr, $issue->started_at);
            $sheet->setCellValue('J' . $row_ctr, $issue->completed_at);
            $sheet->setCellValue('K' . $row_ctr, $issue->remarks);
            $sheet->setCellValue('L' . $row_ctr, $issue->resolver_id == null ? '' : $issue->resolver->name);
            if ($issue->status == 5) {
                $myRating = '<No Rating>';
                if ($issue->rating == 1) {
                    $myRating = 'Very unsatisfied';
                } elseif ($issue->rating == 2) {
                    $myRating = 'Unsatisfied';
                } elseif ($issue->rating == 3) {
                    $myRating = 'Satisfied';
                } elseif ($issue->rating == 4) {
                    $myRating = 'Very satisfied';
                } elseif ($issue->rating == 5) {
                    $myRating = 'Outstanding';
                }
                $sheet->setCellValue('M' . $row_ctr, $myRating);
            }
            //  else {
            //     $sheet->setCellValue('M' . $row_ctr, '<' . $issue->mstatus->status . '>');
            // }
            $row_ctr++;
        }

        // dd('Stop');

        $drawing = new Drawing();
        $drawing->setName('header');
        $drawing->setDescription('header');
        $drawing->setPath(public_path("storage\\report\\report_header.png")); // put your path and image here

        // $drawing->setPath(asset('material\img\report_header.png'));
        // $spreadsheet->getActiveSheet()->mergeCells('A1:M1');
        // $spreadsheet->getActiveSheet()->getStyle('A1:M7')->getAlignment()->setHorizontal('center');
        $drawing->setCoordinates('E1');
        $drawing->setOffsetX(110);
        // $drawing->setRotation(25);
        // $drawing->getShadow()->setVisible(true);
        // $drawing->getShadow()->setDirection(45);
        $drawing->setWorksheet($spreadsheet->getActiveSheet());

        $spreadsheet->getActiveSheet()->getColumnDimension('A')->setWidth(19.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('B')->setWidth(22.43);
        $spreadsheet->getActiveSheet()->getColumnDimension('C')->setWidth(29.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('D')->setWidth(19.71);
        $spreadsheet->getActiveSheet()->getColumnDimension('E')->setWidth(30.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('F')->setWidth(27.29);
        $spreadsheet->getActiveSheet()->getColumnDimension('G')->setWidth(19.86);
        $spreadsheet->getActiveSheet()->getColumnDimension('H')->setWidth(23.71);
        $spreadsheet->getActiveSheet()->getColumnDimension('I')->setWidth(18.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('J')->setWidth(20.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('K')->setWidth(24.71);
        $spreadsheet->getActiveSheet()->getColumnDimension('L')->setWidth(20.43);
        $spreadsheet->getActiveSheet()->getColumnDimension('M')->setWidth(22.14);
        $spreadsheet->getActiveSheet()->getRowDimension('8')->setRowHeight(21);
        $spreadsheet->getActiveSheet()->getRowDimension('9')->setRowHeight(21);
        $spreadsheet->getActiveSheet()->getRowDimension('10')->setRowHeight(21);
        $spreadsheet->getActiveSheet()->getRowDimension('12')->setRowHeight(88.50);

        $spreadsheet->getActiveSheet()->getStyle('A8:M10')->getFont()->setSize(18);

        
        $spreadsheet->getActiveSheet()->getStyle('A1:M12')->getAlignment()->setHorizontal('center');
        $spreadsheet->getActiveSheet()->getStyle('A1:M12')->getAlignment()->setVertical('center');
        $spreadsheet->getActiveSheet()->getStyle('A1:M12')->getAlignment()->setWrapText(true);

        $spreadsheet->getActiveSheet()->getStyle('A12:M12')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('9BC2E6');
        $spreadsheet->getActiveSheet()->getStyle('A12:M12')->getFont()->setSize(15.5);

        $spreadsheet->getActiveSheet()->getStyle('A12:M' . ($row_ctr - 1))->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
        // $spreadsheet->getActiveSheet()->getStyle('A12:M' . ($row_ctr - 1))->getAlignment()->setWrapText(true);

        $row_ctr++;
        $row_ctr++;
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Total number of network and hardware issues received');
        $sheet->setCellValue('G' . $row_ctr, '=');
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Total number of network and hardware issues resolved');
        $sheet->setCellValue('G' . $row_ctr, '=');
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Percentage');
        $sheet->setCellValue('G' . $row_ctr, '=');
        $row_ctr++;
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Prepared by:');
        $sheet->setCellValue('H' . $row_ctr, 'Certified Correct by:');
        $row_ctr++;
        $row_ctr++;
        $row_ctr++;
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, auth()->user()->name);
        $sheet->setCellValue('H' . $row_ctr, 'Yvette G. Batacandolo');
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, auth()->user()->position->name);
        $sheet->setCellValue('H' . $row_ctr, 'Chief Administrative Officer');

        date_default_timezone_set("Asia/Manila");
        $writer = new Xlsx($spreadsheet);
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="Technical_Support_Summary_' . $myMonth . '_' . $request->year . '_' . date("Ymd_His") . '.xlsx"');
        $writer->save("php://output");
        die;

        return back();
    }

    public function generatereport_quarterly(Request $request) {
        ini_set('max_execution_time', '600');
        $this->addsystemlogs('Generate quarterly report');
			
        $myQtr = $request->quarter;
        $myYear = $request->year;

        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->setTitle('Qtr ' . $myQtr);

        $sheet->setCellValue('A8', 'INFORMATION AND COMMUNICATION TECHNOLOGY STAFF');
        $sheet->setCellValue('A9', 'Technical Support Summary');
        $sheet->setCellValue('A10', 'For Quarter ' . $myQtr . ' of ' . $request->year);

        $spreadsheet->getActiveSheet()->mergeCells('A8:M8');
        $spreadsheet->getActiveSheet()->mergeCells('A9:M9');
        $spreadsheet->getActiveSheet()->mergeCells('A10:M10');
        $spreadsheet->getActiveSheet()->getStyle('A8:M10')->getAlignment()->setHorizontal('center');

        $sheet->setCellValue('A12', 'Reference Number');
        $sheet->setCellValue('B12', 'Date');
        $sheet->setCellValue('C12', 'Name');
        $sheet->setCellValue('D12', 'Position');
        $sheet->setCellValue('E12', 'Office/Staff');
        $sheet->setCellValue('F12', 'Level of Priority ');
        $sheet->setCellValue('G12', 'ICT Issue or Problem');
        $sheet->setCellValue('H12', 'ICT Issue /Handled by:');
        $sheet->setCellValue('I12', 'Start of Action');
        $sheet->setCellValue('J12', 'End of Action');
        $sheet->setCellValue('K12', 'Report/Description of Specific Work');
        $sheet->setCellValue('L12', 'ICT Technical Support Personnel');
        $sheet->setCellValue('M12', 'Acceptance Rating');

        $row_ctr = 13;

        $issues = Issue::where(DB::raw('QUARTER(created_at)'), $myQtr)->where(DB::raw('YEAR(created_at)'), $myYear)->where('reff_no', 'NOT LIKE', 'TEMP-%')->where('status', '!=', 6)->get();
        $archives = Archive::where(DB::raw('QUARTER(created_at)'), $myQtr)->where(DB::raw('YEAR(created_at)'), $myYear)->where('reff_no', 'NOT LIKE', 'TEMP-%')->where('status', '!=', 6)->get();

        foreach($issues->merge($archives)->all() as $issue) {
            $sheet->setCellValue('A' . $row_ctr, $issue->reff_no);
            $sheet->setCellValue('B' . $row_ctr, $issue->created_at->format('m/d/Y'));
            $sheet->setCellValue('C' . $row_ctr, $issue->user->name);

            // dump($issue->user->position_id);
            $sheet->setCellValue('D' . $row_ctr, $issue->user->position->name);
            $sheet->setCellValue('E' . $row_ctr, $issue->user->mstaff->abbreviation);
            $sheet->setCellValue('F' . $row_ctr, $issue->prioritydesc());
            $sheet->setCellValue('G' . $row_ctr, $issue->category->name);
            $sheet->setCellValue('H' . $row_ctr, $issue->resolver_id == null ? '' : $issue->resolver->name);
            $sheet->setCellValue('I' . $row_ctr, $issue->started_at);
            $sheet->setCellValue('J' . $row_ctr, $issue->completed_at);
            $sheet->setCellValue('K' . $row_ctr, $issue->remarks);
            $sheet->setCellValue('L' . $row_ctr, $issue->resolver_id == null ? '' : $issue->resolver->name);
            if ($issue->status == 5) {
                $myRating = '<No Rating>';
                if ($issue->rating == 1) {
                    $myRating = 'Very unsatisfied';
                } elseif ($issue->rating == 2) {
                    $myRating = 'Unsatisfied';
                } elseif ($issue->rating == 3) {
                    $myRating = 'Satisfied';
                } elseif ($issue->rating == 4) {
                    $myRating = 'Very satisfied';
                } elseif ($issue->rating == 5) {
                    $myRating = 'Outstanding';
                }
                $sheet->setCellValue('M' . $row_ctr, $myRating);
            }
            //  else {
            //     $sheet->setCellValue('M' . $row_ctr, '<' . $issue->mstatus->status . '>');
            // }
            $row_ctr++;
        }

        // dd('Stop');

        $drawing = new Drawing();
        $drawing->setName('header');
        $drawing->setDescription('header');
        $drawing->setPath(public_path("storage\\report\\report_header.png")); // put your path and image here

        // $drawing->setPath(asset('material\img\report_header.png'));
        // $spreadsheet->getActiveSheet()->mergeCells('A1:M1');
        // $spreadsheet->getActiveSheet()->getStyle('A1:M7')->getAlignment()->setHorizontal('center');
        $drawing->setCoordinates('E1');
        $drawing->setOffsetX(110);
        // $drawing->setRotation(25);
        // $drawing->getShadow()->setVisible(true);
        // $drawing->getShadow()->setDirection(45);
        $drawing->setWorksheet($spreadsheet->getActiveSheet());

        $spreadsheet->getActiveSheet()->getColumnDimension('A')->setWidth(19.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('B')->setWidth(22.43);
        $spreadsheet->getActiveSheet()->getColumnDimension('C')->setWidth(29.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('D')->setWidth(19.71);
        $spreadsheet->getActiveSheet()->getColumnDimension('E')->setWidth(30.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('F')->setWidth(27.29);
        $spreadsheet->getActiveSheet()->getColumnDimension('G')->setWidth(19.86);
        $spreadsheet->getActiveSheet()->getColumnDimension('H')->setWidth(23.71);
        $spreadsheet->getActiveSheet()->getColumnDimension('I')->setWidth(18.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('J')->setWidth(20.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('K')->setWidth(24.71);
        $spreadsheet->getActiveSheet()->getColumnDimension('L')->setWidth(20.43);
        $spreadsheet->getActiveSheet()->getColumnDimension('M')->setWidth(22.14);
        $spreadsheet->getActiveSheet()->getRowDimension('8')->setRowHeight(21);
        $spreadsheet->getActiveSheet()->getRowDimension('9')->setRowHeight(21);
        $spreadsheet->getActiveSheet()->getRowDimension('10')->setRowHeight(21);
        $spreadsheet->getActiveSheet()->getRowDimension('12')->setRowHeight(88.50);

        $spreadsheet->getActiveSheet()->getStyle('A8:M10')->getFont()->setSize(18);

        
        $spreadsheet->getActiveSheet()->getStyle('A1:M12')->getAlignment()->setHorizontal('center');
        $spreadsheet->getActiveSheet()->getStyle('A1:M12')->getAlignment()->setVertical('center');
        $spreadsheet->getActiveSheet()->getStyle('A1:M12')->getAlignment()->setWrapText(true);

        $spreadsheet->getActiveSheet()->getStyle('A12:M12')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('9BC2E6');
        $spreadsheet->getActiveSheet()->getStyle('A12:M12')->getFont()->setSize(15.5);

        $spreadsheet->getActiveSheet()->getStyle('A12:M' . ($row_ctr - 1))->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
        // $spreadsheet->getActiveSheet()->getStyle('A12:M' . ($row_ctr - 1))->getAlignment()->setWrapText(true);

        $row_ctr++;
        $row_ctr++;
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Total number of network and hardware issues received');
        $sheet->setCellValue('G' . $row_ctr, '=');
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Total number of network and hardware issues resolved');
        $sheet->setCellValue('G' . $row_ctr, '=');
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Percentage');
        $sheet->setCellValue('G' . $row_ctr, '=');
        $row_ctr++;
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Prepared by:');
        $sheet->setCellValue('H' . $row_ctr, 'Certified Correct by:');
        $row_ctr++;
        $row_ctr++;
        $row_ctr++;
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, auth()->user()->name);
        $sheet->setCellValue('H' . $row_ctr, 'Emarson T. Ochoa');
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, auth()->user()->position->name);
        $sheet->setCellValue('H' . $row_ctr, 'Information Technology Officer II');

        date_default_timezone_set("Asia/Manila");
        $writer = new Xlsx($spreadsheet);
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="Technical_Support_Summary_Qtr' . $myQtr . '_' . $myYear . '_' . date("Ymd_His") . '.xlsx"');
        $writer->save("php://output");
        die;

        return back();
    }

    public function generatereport_yearly(Request $request) {
        ini_set('max_execution_time', '600');
        $this->addsystemlogs('Generate annual report');

        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->setTitle($request->year);

        $sheet->setCellValue('A8', 'Finance and Administrative Division - ICT Unit');
        $sheet->setCellValue('A9', 'Technical Support Summary');
        $sheet->setCellValue('A10', 'For the year of ' . $request->year);

        $spreadsheet->getActiveSheet()->mergeCells('A8:M8');
        $spreadsheet->getActiveSheet()->mergeCells('A9:M9');
        $spreadsheet->getActiveSheet()->mergeCells('A10:M10');
        $spreadsheet->getActiveSheet()->getStyle('A8:M10')->getAlignment()->setHorizontal('center');

        $sheet->setCellValue('A12', 'Reference Number');
        $sheet->setCellValue('B12', 'Date');
        $sheet->setCellValue('C12', 'Name');
        $sheet->setCellValue('D12', 'Position');
        $sheet->setCellValue('E12', 'Office/Staff');
        $sheet->setCellValue('F12', 'Level of Priority ');
        $sheet->setCellValue('G12', 'ICT Issue or Problem');
        $sheet->setCellValue('H12', 'ICT Issue /Handled by:');
        $sheet->setCellValue('I12', 'Start of Action');
        $sheet->setCellValue('J12', 'End of Action');
        $sheet->setCellValue('K12', 'Report/Description of Specific Work');
        $sheet->setCellValue('L12', 'ICT Technical Support Personnel');
        $sheet->setCellValue('M12', 'Acceptance Rating');

        $row_ctr = 13;
        $date = $request->year . '-';
        // $date = date('Y-m-');
      
        $issues = Issue::where('created_at', 'LIKE', "{$date}%")->where('reff_no', 'NOT LIKE', 'TEMP-%')->where('status', '!=', 6)->get();
        $archives = Archive::where('created_at', 'LIKE', "{$date}%")->where('reff_no', 'NOT LIKE', 'TEMP-%')->where('status', '!=', 6)->get();

        foreach($issues->merge($archives)->all() as $issue) {
            $sheet->setCellValue('A' . $row_ctr, $issue->reff_no);
            $sheet->setCellValue('B' . $row_ctr, $issue->created_at->format('m/d/Y'));
            $sheet->setCellValue('C' . $row_ctr, $issue->user->name);

            // dump($issue->user->position_id);
            $sheet->setCellValue('D' . $row_ctr, $issue->user->position->name);
            $sheet->setCellValue('E' . $row_ctr, $issue->user->mstaff->abbreviation);
            $sheet->setCellValue('F' . $row_ctr, $issue->prioritydesc());
            $sheet->setCellValue('G' . $row_ctr, $issue->category->name);
            $sheet->setCellValue('H' . $row_ctr, $issue->resolver_id == null ? '' : $issue->resolver->name);
            $sheet->setCellValue('I' . $row_ctr, $issue->started_at);
            $sheet->setCellValue('J' . $row_ctr, $issue->completed_at);
            $sheet->setCellValue('K' . $row_ctr, $issue->remarks);
            $sheet->setCellValue('L' . $row_ctr, $issue->resolver_id == null ? '' : $issue->resolver->name);
            if ($issue->status == 5) {
                $myRating = '<No Rating>';
                if ($issue->rating == 1) {
                    $myRating = 'Very unsatisfied';
                } elseif ($issue->rating == 2) {
                    $myRating = 'Unsatisfied';
                } elseif ($issue->rating == 3) {
                    $myRating = 'Satisfied';
                } elseif ($issue->rating == 4) {
                    $myRating = 'Very satisfied';
                } elseif ($issue->rating == 5) {
                    $myRating = 'Outstanding';
                }
                $sheet->setCellValue('M' . $row_ctr, $myRating);
            }
            //  else {
            //     $sheet->setCellValue('M' . $row_ctr, '<' . $issue->mstatus->status . '>');
            // }
            $row_ctr++;
        }

        // dd('Stop');

        $drawing = new Drawing();
        $drawing->setName('header');
        $drawing->setDescription('header');
        $drawing->setPath(public_path("storage\\report\\report_header.png")); // put your path and image here

        // $drawing->setPath(asset('material\img\report_header.png'));
        // $spreadsheet->getActiveSheet()->mergeCells('A1:M1');
        // $spreadsheet->getActiveSheet()->getStyle('A1:M7')->getAlignment()->setHorizontal('center');
        $drawing->setCoordinates('E1');
        $drawing->setOffsetX(110);
        // $drawing->setRotation(25);
        // $drawing->getShadow()->setVisible(true);
        // $drawing->getShadow()->setDirection(45);
        $drawing->setWorksheet($spreadsheet->getActiveSheet());

        $spreadsheet->getActiveSheet()->getColumnDimension('A')->setWidth(19.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('B')->setWidth(22.43);
        $spreadsheet->getActiveSheet()->getColumnDimension('C')->setWidth(29.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('D')->setWidth(19.71);
        $spreadsheet->getActiveSheet()->getColumnDimension('E')->setWidth(30.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('F')->setWidth(27.29);
        $spreadsheet->getActiveSheet()->getColumnDimension('G')->setWidth(19.86);
        $spreadsheet->getActiveSheet()->getColumnDimension('H')->setWidth(23.71);
        $spreadsheet->getActiveSheet()->getColumnDimension('I')->setWidth(18.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('J')->setWidth(20.14);
        $spreadsheet->getActiveSheet()->getColumnDimension('K')->setWidth(24.71);
        $spreadsheet->getActiveSheet()->getColumnDimension('L')->setWidth(20.43);
        $spreadsheet->getActiveSheet()->getColumnDimension('M')->setWidth(22.14);
        $spreadsheet->getActiveSheet()->getRowDimension('8')->setRowHeight(21);
        $spreadsheet->getActiveSheet()->getRowDimension('9')->setRowHeight(21);
        $spreadsheet->getActiveSheet()->getRowDimension('10')->setRowHeight(21);
        $spreadsheet->getActiveSheet()->getRowDimension('12')->setRowHeight(88.50);

        $spreadsheet->getActiveSheet()->getStyle('A8:M10')->getFont()->setSize(18);

        
        $spreadsheet->getActiveSheet()->getStyle('A1:M12')->getAlignment()->setHorizontal('center');
        $spreadsheet->getActiveSheet()->getStyle('A1:M12')->getAlignment()->setVertical('center');
        $spreadsheet->getActiveSheet()->getStyle('A1:M12')->getAlignment()->setWrapText(true);

        $spreadsheet->getActiveSheet()->getStyle('A12:M12')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('9BC2E6');
        $spreadsheet->getActiveSheet()->getStyle('A12:M12')->getFont()->setSize(15.5);

        $spreadsheet->getActiveSheet()->getStyle('A12:M' . ($row_ctr - 1))->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
        // $spreadsheet->getActiveSheet()->getStyle('A12:M' . ($row_ctr - 1))->getAlignment()->setWrapText(true);

        $row_ctr++;
        $row_ctr++;
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Total number of network and hardware issues received');
        $sheet->setCellValue('G' . $row_ctr, '=');
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Total number of network and hardware issues resolved');
        $sheet->setCellValue('G' . $row_ctr, '=');
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Percentage');
        $sheet->setCellValue('G' . $row_ctr, '=');
        $row_ctr++;
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, 'Prepared by:');
        $sheet->setCellValue('H' . $row_ctr, 'Certified Correct by:');
        $row_ctr++;
        $row_ctr++;
        $row_ctr++;
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, auth()->user()->name);
        $sheet->setCellValue('H' . $row_ctr, 'Yvette G. Batacandolo');
        $row_ctr++;
        $sheet->setCellValue('E' . $row_ctr, auth()->user()->position->name);
        $sheet->setCellValue('H' . $row_ctr, 'Chief Administrative Officer');

        date_default_timezone_set("Asia/Manila");
        $writer = new Xlsx($spreadsheet);
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="Technical_Support_Summary_' . $request->year . '_' . date("Ymd_His") . '.xlsx"');
        $writer->save("php://output");
        die;

        return back();
    }
}
