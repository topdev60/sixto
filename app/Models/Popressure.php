<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Popressure extends Model
{
    use HasFactory;
    protected $table = 'porepressure';
    protected $primaryKey = 'PP_ID';
}
