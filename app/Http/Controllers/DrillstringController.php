<?php

namespace App\Http\Controllers;

use App\Models\Drillstring;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

use App\Models\DsComp;
use Illuminate\Support\Facades\Session;

class DrillstringController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $module = 'DrillString';
    public function index()
    {
        $location = '';
        $selectedProjectId = Session::get('projectId');
        // $dscomp = DsComp::where('')
        if ( Auth::user()->role == 1 ) {
            $location = 'Backend';
        }else{
            $location = 'Frontend';
        }

        return view($location.'.Drillstring.index')->with('module', $this->module);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Drillstring  $drillstring
     * @return \Illuminate\Http\Response
     */
    public function show(Drillstring $drillstring)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Drillstring  $drillstring
     * @return \Illuminate\Http\Response
     */
    public function edit(Drillstring $drillstring)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Drillstring  $drillstring
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Drillstring $drillstring)
    {
        
    }

    public function getDrillStringData(Request $request)
    {
        $drillstringId = $request->drillstringId;
        $selectedDrillString = Drillstring::where('DS_ID', $drillstringId)->first();
        Session::put('selectedDrillString', $selectedDrillString);

        $nozzles = DB::table('nozzle')->where('DS_ID', $drillstringId)->get();
        Session::put('nozzles', $nozzles);
        
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Drillstring  $drillstring
     * @return \Illuminate\Http\Response
     */
    public function destroy(Drillstring $drillstring)
    {
        //
    }
}
