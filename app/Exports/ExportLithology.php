<?php

namespace App\Exports;

use App\Models\Lithology;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ExportLithlogy implements FromCollection, WithHeadings
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
        return Lithology::select('Description', 'MD', 'TVD', 'TC', 'SH')->where('ProjectID', $this->projectId)->orderby('LithoID', 'asc')->get();
    }
    public function headings():array
        {
            return [
                'Description',
                'MD', 
                'TVD', 
                'TC', 
                'SH'
            ];
        } 
}
