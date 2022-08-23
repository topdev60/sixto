<?php

namespace App\Exports;

use App\Models\Fluids;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ExportFluids implements FromCollection, WithHeadings
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
        return Fluids::select('Description', 'Density', 'Type', 'Rheology', 'YP', 'PV', 'K', 'n', 'Viscosity', 'Oil', 'Water', 'TC', 'SH')->where('ProjectID', $this->projectId)->orderby('FluidID', 'asc')->get();
    }

    public function headings():array
        {
            return [
                'Description',
                'Density',
                'Type',
                'Rheology',
                'YP',
                'PV',
                'K',
                'n',
                'Viscosity',
                'Oil',
                'Water',
                'TC',
                'SH',
            ];
        } 
}
