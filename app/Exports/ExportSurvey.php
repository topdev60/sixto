<?php

namespace App\Exports;

use App\Models\Survey;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ExportSurvey implements FromCollection, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    protected $projectId;
    function __construct($projectId)
    {
        $this->projectId = $projectId;
    }
    public function collection()
    {   
        return Survey::select('MD', 'Inc', 'Azimuth', 'TVD', 'North', 'East')->where('ProjectID', $this->projectId)->orderby('id', 'asc')->get();
    }
    public function headings():array
        {
            return [
                'MD',
                'INC',
                'Azimuth',
                'TVD',
                'North',
                'East',
            ];
        } 
}
