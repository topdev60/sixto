<?php

namespace App\Exports;

use App\Models\Temperature;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ExportTemperature implements FromCollection, WithHeadings
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
        return Temperature::select('TVD', 'TG', 'Temperature')->where('ProjectID', $this->projectId)->orderby('TempID', 'asc')->get();
    }

    public function headings():array
        {
            return [
                '(Depth)TVD',
                'Temperature Gradient',
                'Temperature',
            ];
        } 
}
