<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UnitForUser extends Model
{
    use HasFactory;
    protected $table = 'unit_user';
    protected $fillable = ['id', 'UserID', 'Pressure', 'Temperature', 'Density', 'Flow', 'Length'];
}
