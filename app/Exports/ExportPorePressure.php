<?php

namespace App\Exports;

use App\Models\Popressure;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ExportPorePressure implements FromCollection, WithHeadings
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
        return Popressure::select('TVD', 'PP', 'Pressure')->where('ProjectID', $this->projectId)->orderby('PP_ID', 'asc')->get();
    }
    public function headings():array
        {
            return [
                '(Depth)TVD',
                'Pressure Gradient',
                'Pressure',
            ];
        } 
}
