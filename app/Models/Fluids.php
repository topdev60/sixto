<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Fluids extends Model
{
    use HasFactory;
    protected $table = 'fluids';
    protected $primaryKey = 'FluidID';

    public function sample()
    {
        return $this->hasMany(Sample::class, 'FluidID');
    }
}
