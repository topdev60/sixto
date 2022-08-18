<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Unit;
use App\Models\UnitForUser;

class UnitController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $module = 'Units';
    public function index()
    {
        $pressureUnits          = Unit::where('concept_id', 1)->get();
        $temperatureUnits       = Unit::where('concept_id', 2)->get();
        $densityUnits           = Unit::where('concept_id', 3)->get();
        $flowUnits              = Unit::where('concept_id', 4)->get();
        $lengthUnits            = Unit::where('concept_id', 5)->get();

        $preferPressure         = DB::table('unit_user')->select('Pressure')    ->where('UserID', Auth::id())->first();
        $preferTemperature      = DB::table('unit_user')->select('Temperature') ->where('UserID', Auth::id())->first();
        $preferDensity          = DB::table('unit_user')->select('Density')     ->where('UserID', Auth::id())->first();
        $preferFlow             = DB::table('unit_user')->select('Flow')        ->where('UserID', Auth::id())->first();
        $preferLength           = DB::table('unit_user')->select('Length')      ->where('UserID', Auth::id())->first();

        $location               = Auth::user()->role == 1 ? 'Backend' : 'Frontend';
        return view($location.'.Units.index')
            ->with('module',            $this->module)
            ->with('pressureUnits',     $pressureUnits)
            ->with('temperatureUnits',  $temperatureUnits)
            ->with('densityUnits',      $densityUnits)
            ->with('flowUnits',         $flowUnits)
            ->with('lengthUnits',       $lengthUnits)
            ->with('preferPressure',    $preferPressure)
            ->with('preferTemperature', $preferTemperature)
            ->with('preferDensity',     $preferDensity)
            ->with('preferFlow',        $preferFlow)
            ->with('preferLength',      $preferLength);
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $pressure       = $request->pressure;
        $density        = $request->density;
        $temperature    = $request->temperature;
        $flow           = $request->flow;
        $length         = $request->length;

        UnitForUser::updateOrCreate(
            ['UserID'       => Auth::id()],
            [
                'Pressure'         =>$pressure,
                'Temperature'      =>$temperature,
                'Density'          =>$density,
                'Flow'             =>$flow,
                'Length'           =>$length,
            ],
        );

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
