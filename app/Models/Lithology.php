<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lithology extends Model
{
    use HasFactory;
    protected $table = 'lithology';
    protected $primaryKey = 'LithoID';
}
