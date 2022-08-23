<?php

namespace App\Exports;

use App\Models\Fgpressure;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ExportFgPressure implements FromCollection, WithHeadings
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
        return Fgpressure::select('TVD', 'FG', 'Pressure')->where('ProjectID', $this->projectId)->orderby('FG_ID', 'asc')->get();
    }
    public function headings():array
        {
            return [
                '(Depth)TVD',
                'Fracture Gradient',
                'Pressure',
            ];
        } 
}
