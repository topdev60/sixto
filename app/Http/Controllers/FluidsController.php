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
}
