<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Surfpiping extends Model
{
    use HasFactory;
    protected $table = 'surfpiping';
    protected $primaryKey = 'SurfID';
}
