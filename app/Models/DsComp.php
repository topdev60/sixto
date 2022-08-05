<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DsComp extends Model
{
    use HasFactory;
    protected $table = 'ds_comp';
    protected $primaryKey = 'Comp_ID';

    public function drillstring()
    {
        return $this->belongsTo(Drillstring::class, 'DS_ID');
    }
}
