<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sample extends Model
{
    use HasFactory;
    protected $table = 'samples';
    protected $primaryKey = 'SampleID';

    public function fluids()
    {
        return $this->belongsTo(Fluids::class, 'FluidID');
    }
}
