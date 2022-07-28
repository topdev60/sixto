<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Models\WellInfo;

class UserDashboardController extends Controller
{
    public function index(){
        $projects = WellInfo::where('UserID', Auth::id())->get();
        $module = 'Project';
        return view('Frontend.dashboard')->with('projects', $projects)->with('module', $module) ;
    }
}
