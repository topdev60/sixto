<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WellBore extends Model
{
    use HasFactory;
    protected $primaryKey = 'WellboreID';
    protected $table = 'wellbore';
}