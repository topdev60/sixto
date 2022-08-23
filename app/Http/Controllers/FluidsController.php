<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;

use App\Models\Fluids;
use App\Models\Sample;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;

class FluidsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $module = 'Fluids';
    public function index()
    {
        $selectedProjectID     = Session::get('projectId');
        $fluids                = Fluids::where('ProjectID', $selectedProjectID)->get();
        foreach ($fluids as $key => $fluid) {
            if($key == 0){
                if(!Session::has('fluidId')){
                    Session::put('fluidId', $fluid->FluidID);
                }
            }
        }
        $location              = Auth::user()->role == 1 ? 'Backend' : 'Frontend';
        return view($location.'.Fluids.index')->with('module', $this->module)->with('fluids', $fluids);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function selectFluid($id)
    {
        
        $fluidInfo = Fluids::where('FluidID', $id)->first();
        $location = Auth::user()->role == 1 ? 'admin' : 'user';
        Session::put('fluidId', $fluidInfo->FluidID);
        Session::put('fluidDesc', $fluidInfo->Description);
        Session::put('fluidInfo', $fluidInfo);
        Session::put('selectedSampleID', $fluidInfo->SampleID);
        return redirect()->route($location.'.fluids.index');
    }
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
        $fluid = DB::table('fluids')->insertGetID([
            'ProjectID'         => Session::get('projectId'),
            'Description'       => $request->description,
            'Density'           => $request->density,
            'Type'              => $request->type,
            'Rheology'          => $request->rheology,
            'YP'                => $request->yp,
            'PV'                => $request->pv,
            'K'                 => $request->k,
            'n'                 => $request->n,
            'Viscosity'         => $request->viscosity,
            'Oil'               => $request->oil,
            'Water'             => $request->water,
            'TC'                => $request->tc,
            'SH'                => $request->sh,
        ]);
    
        $sample = DB::table('samples')->insertGetId([
            'FluidID'       => $fluid,
        ]);

        DB::table('fluids')->where('FluidID', $fluid)->update([
            'SampleID'      => $sample,
        ]);
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  Fluid ID
     * @return \Illuminate\Http\Response
     * set Session Selected Fulid Information
     */
    public function show(Request $request)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Fluids  $fluids
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Fluids  $fluids
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $fluid = Fluids::where('FluidID', $request->FluidID)->update([
            'ProjectID'     => Session::get('projectId'),
            'Description'   => $request->description,
            'Density'       => $request->density,
            'Type'          => $request->type,
            'Rheology'      => $request->rheology,
            'YP'            => $request->yp,
            'PV'            => $request->pv,
            'K'             => $request->k,
            'n'             => $request->n,
            'Viscosity'     => $request->viscosity,
            'Oil'           => $request->oil,
            'Water'         => $request->water,
            'TC'            => $request->tc,
            'SH'            => $request->sh,
        ]);

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Fluids  $fluids
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        Fluids::where('FluidID', $request->FluidID)->delete();
        Sample::where('FluidID', $request->FluidID)->delete();
        return redirect()->back();
    }

    public function deleteAllRows($id=null)
    {
        // $fluids = Fluids::where('ProhectID', $id)->get();
        // foreach ($fluids as $key => $fluid) {
        //     Sample::where('FluidID', $fluid->FluidID)->delete();
        //     $fluid->delete();
        // }
        return redirect()->back();
    }

    public function storePasteData(Request $request)
    {
        $projectId = Session::get('projectId');
        $rows = $request->rows;
        $rows = json_decode($rows);
        $newRows = [];
        unset($rows[count($rows)-1]); //because last element has "" value
        foreach ($rows as $key => $row) {
            $row = str_replace("\r", "", $row);
            $row = explode("\t", $row);
            Fluids::insert([
                'ProjectID'     => $projectId,
                'Description'   => $row[0],
                'Density'       => $row[1],
                'Type'          => $row[2],
                'Rheology'      => $row[3],
                'YP'            => $row[4],
                'PV'            => $row[5],
                'K'             => $row[6],
                'n'             => $row[7],
                'Viscosity'     => $row[8],
                'Oil'           => $row[9],
                'Water'         => $row[10],
                'TC'            => $row[11],
                'SH'            => $row[12],
            ]);
        }
        return 1;
    }

}
