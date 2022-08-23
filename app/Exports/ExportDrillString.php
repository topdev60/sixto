<?php

namespace App\Exports;

use App\Models\DsComp;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ExportDrillString implements FromCollection, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    protected $ds_id;
    function __construct($ds_id)
    {
        $this->ds_id = $ds_id;
    }
    
    public function collection()
    {
        return DsComp::select('Description', 'ID', 'OD', 'Weight', 'Length', 'TJ')->where('DS_ID', $this->ds_id)->orderby('Comp_ID', 'asc')->get();
    }

    public function headings():array
        {
            return [
                'Description',
                'ID',
                'OD',
                'Weight',
                'Length',
                'TJ',
            ];
        } 
}
