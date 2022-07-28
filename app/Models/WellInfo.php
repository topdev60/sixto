<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WellInfo extends Model
{
    protected $primaryKey = 'ProjectID';
    protected $table = 'wellinfo';
    protected $fillable = ['ProjectID', 'UserID', 'project_name', 'location', 'field', 'lease', 'operator', 'rigcontroller', 'rigtype', 'wellname', 'rigname'];
    use HasFactory;
}
