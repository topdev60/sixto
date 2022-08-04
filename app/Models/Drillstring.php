<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Drillstring extends Model
{
    use HasFactory;
    protected $table = 'drillstring';
    protected $primaryKey = 'DS_ID';
}
