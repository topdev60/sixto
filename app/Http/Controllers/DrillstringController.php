<?php

namespace App\Http\Controllers;

use App\Models\Drillstring;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

use App\Models\DsComp;
use Illuminate\Support\Facades\Session;
use Laravel\Ui\Presets\React;

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
        $drillStrings = Drillstring::where('ProjectID', $selectedProjectId)->get();

        if(!Session::has('dsInfo')){
            $dsInfo = Drillstring::where('DS_ID', 1)->first();
            Session::put('dsInfo', $dsInfo);
        }
        if ( Auth::user()->role == 1 ) {
            $location = 'Backend';
        }else{
            $location = 'Frontend';
        }
        return view($location.'.Drillstring.index')
            ->with('module', $this->module)
            ->with('drillStrings', $drillStrings);
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
        DsComp::insert([
            'DS_ID' => $request->ds_id,
            'Description' => $request->comp_decription,
            'OD' => $request->comp_od,
            'ID' => $request->comp_id,
            'TJ' => $request->comp_tj,
            'Weight' => $request->comp_weight,
            'Length' => $request->comp_length,
        ]);

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Drillstring  $drillstring
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $ds_id = $request->selectDrillstring;
        $dsInfo = Drillstring::where('DS_ID', $ds_id)->first();
        Session::put('dsInfo', $dsInfo);
        $location = 'user';
        if(Auth::user()->role == 1) $location = 'admin';
        return redirect()->route($location.'.drillstring.index');
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
    public function update(Request $request)
    {
        DsComp::where('Comp_ID', $request->id)->update([
            'DS_ID' => $request->ds_id,
            'Description' => $request->comp_decription,
            'OD' => $request->comp_od,
            'ID' => $request->comp_id,
            'TJ' => $request->comp_tj,
            'Weight' => $request->comp_weight,
            'Length' => $request->comp_length,
        ]);

        return redirect()->back();
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
    public function destroy(Request $request)
    {
        DsComp::where('Comp_ID', $request->id)->delete();
        return redirect()->back();
    }
}
