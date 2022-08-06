<?php

namespace App\Http\Controllers;

use App\Models\Fgpressure;
use App\Models\Lithology;
use App\Models\Popressure;
use App\Models\Temperature;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class FormationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $module = 'Formation';
        $selectedProjectId = Session::get('projectId');
        $porepressure = Popressure::where('ProjectID', $selectedProjectId)->paginate(10);
        $pressureUnits = DB::table('standard_unit')->where('concept_id', 1)->get();
        $tempUnits = DB::table('standard_unit')->where('concept_id', 2)->get();
        $flowUnits = DB::table('standard_unit')->where('concept_id', 3)->get();
        $densityUnits = DB::table('standard_unit')->where('concept_id', 4)->get();
        $lengthUnits = DB::table('standard_unit')->where('concept_id', 5)->get();
        if(Auth::user()->role == 1){
            return view('Backend.Formation.SubTabs.porepressure')->with('porepressure', $porepressure)->with('module', $module)->with('tab', 1)
                ->with('pressureUnits', $pressureUnits)
                ->with('tempUnits', $tempUnits)
                ->with('flowUnits', $flowUnits)
                ->with('densityUnits', $densityUnits)
                ->with('lengthUnits', $lengthUnits);
        }else {
            return view('Frontend.Formation.SubTabs.porepressure')->with('porepressure', $porepressure)->with('module', $module)->with('tab', 1)
                ->with('pressureUnits', $pressureUnits)
                ->with('tempUnits', $tempUnits)
                ->with('flowUnits', $flowUnits)
                ->with('densityUnits', $densityUnits)
                ->with('lengthUnits', $lengthUnits);    
        }
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
        $temp = Temperature::insert([
            'ProjectID' => Session::get('projectId'),
            'TVD' => $request->tvd,
            'TG' => $request->tg,
            'Temperature' => $request->temperature,
        ]);
        if ($temp) {
            return redirect()->back();
        }else {
            return 'Error';
        }
    }
    
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $selectedProjectId = Session::get('projectId');
        $pressureUnits = DB::table('standard_unit')->where('concept_id', 1)->get();
        $tempUnits = DB::table('standard_unit')->where('concept_id', 2)->get();
        $flowUnits = DB::table('standard_unit')->where('concept_id', 3)->get();
        $densityUnits = DB::table('standard_unit')->where('concept_id', 4)->get();
        $lengthUnits = DB::table('standard_unit')->where('concept_id', 5)->get();
        switch ($slug) {
            case 'porepressure':
                $porepressure = Popressure::where('ProjectID', $selectedProjectId)->paginate(10);
                if(Auth::user()->role == 1){
                    return view('Backend.Formation.SubTabs.porepressure')
                        ->with('porepressure', $porepressure)
                        ->with('module', 'Formation')
                        ->with('tab', 1)
                        ->with('pressureUnits', $pressureUnits)
                        ->with('tempUnits', $tempUnits)
                        ->with('flowUnits', $flowUnits)
                        ->with('densityUnits', $densityUnits)
                        ->with('lengthUnits', $lengthUnits);
                }else {
                    return view('Frontend.Formation.SubTabs.porepressure')
                        ->with('porepressure', $porepressure)
                        ->with('module', 'Formation')
                        ->with('tab', 1)
                        ->with('pressureUnits', $pressureUnits)
                        ->with('tempUnits', $tempUnits)
                        ->with('flowUnits', $flowUnits)
                        ->with('densityUnits', $densityUnits)
                        ->with('lengthUnits', $lengthUnits);
                }
                break;
            case 'fracture':
                $fgpressure = Fgpressure::where('ProjectID', $selectedProjectId)->paginate(10);
                if(Auth::user()->role == 1){
                    return view('Backend.Formation.SubTabs.fracture')
                        ->with('fgpressure', $fgpressure)
                        ->with('module', 'Formation')
                        ->with('tab', 2)
                        ->with('pressureUnits', $pressureUnits)
                        ->with('tempUnits', $tempUnits)
                        ->with('flowUnits', $flowUnits)
                        ->with('densityUnits', $densityUnits)
                        ->with('lengthUnits', $lengthUnits);
                }else {
                    return view('Frontend.Formation.SubTabs.fracture')
                        ->with('fgpressure', $fgpressure)
                        ->with('module', 'Formation')
                        ->with('tab', 2)
                        ->with('pressureUnits', $pressureUnits)
                        ->with('tempUnits', $tempUnits)
                        ->with('flowUnits', $flowUnits)
                        ->with('densityUnits', $densityUnits)
                        ->with('lengthUnits', $lengthUnits);
                }
                break;
            case 'formation':
                $temperatures = Temperature::where('ProjectID', $selectedProjectId)->paginate(10);
                if(Auth::user()->role == 1){
                    return view('Backend.Formation.SubTabs.formation')
                        ->with('temperatures', $temperatures)
                        ->with('module', 'Formation')
                        ->with('tab', 3)
                        ->with('pressureUnits', $pressureUnits)
                        ->with('tempUnits', $tempUnits)
                        ->with('flowUnits', $flowUnits)
                        ->with('densityUnits', $densityUnits)
                        ->with('lengthUnits', $lengthUnits);
                }else {
                    return view('Frontend.Formation.SubTabs.formation')
                        ->with('temperatures', $temperatures)
                        ->with('module', 'Formation')
                        ->with('tab', 3)
                        ->with('pressureUnits', $pressureUnits)
                        ->with('tempUnits', $tempUnits)
                        ->with('flowUnits', $flowUnits)
                        ->with('densityUnits', $densityUnits)
                        ->with('lengthUnits', $lengthUnits);
                }
                break;
            case 'lithology':
                $lithologies = Lithology::where('ProjectID', $selectedProjectId)->paginate(10);
                if(Auth::user()->role == 1){
                    return view('Backend.Formation.SubTabs.lithology')
                    ->with('lithologies', $lithologies)
                    ->with('module', 'Formation')
                    ->with('tab', 4)
                    ->with('pressureUnits', $pressureUnits)
                    ->with('tempUnits', $tempUnits)
                    ->with('flowUnits', $flowUnits)
                    ->with('densityUnits', $densityUnits)
                    ->with('lengthUnits', $lengthUnits);
                }else {
                    return view('Frontend.Formation.SubTabs.lithology')
                        ->with('lithologies', $lithologies)
                        ->with('module', 'Formation')
                        ->with('tab', 4)
                        ->with('pressureUnits', $pressureUnits)
                        ->with('tempUnits', $tempUnits)
                        ->with('flowUnits', $flowUnits)
                        ->with('densityUnits', $densityUnits)
                        ->with('lengthUnits', $lengthUnits);
                }
                break;
            default:
                $porepressure = Popressure::where('ProjectID', $selectedProjectId)->paginate(10);
                if(Auth::user()->role == 1){
                    return view('Backend.Formation.SubTabs.porepressure')
                        ->with('porepressure', $porepressure)
                        ->with('module', 'Formation')
                        ->with('tab', 1)
                        ->with('pressureUnits', $pressureUnits)
                        ->with('tempUnits', $tempUnits)
                        ->with('flowUnits', $flowUnits)
                        ->with('densityUnits', $densityUnits)
                        ->with('lengthUnits', $lengthUnits);
                }else {
                    return view('Frontend.Formation.SubTabs.porepressure')
                        ->with('porepressure', $porepressure)
                        ->with('module', 'Formation')
                        ->with('tab', 1)
                        ->with('pressureUnits', $pressureUnits)
                        ->with('tempUnits', $tempUnits)
                        ->with('flowUnits', $flowUnits)
                        ->with('densityUnits', $densityUnits)
                        ->with('lengthUnits', $lengthUnits);
                }
                break;
        }
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
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * allocate units into Session
     * @param Request $request
     * 
     */

     public function setunit(Request $request)
     {

        $length_id = isset($request->length) ? $request->length : 22;
        $pressure_id = isset($request->pressure) ? $request->pressure: 16;
        $density_id = isset($request->density) ? $request->density : 1;
        $temp_id = isset($request->temp) ? $request->temp : 5;
        $temp_id = isset($request->tempGrad) ? $request->tempGrad : 5;

        // $pressureUnits
        // $tempUnits
        // $flowUnits
        // $densityUnits
        // $lengthUnits

        $length = DB::table('standard_unit')->where('id', $length_id)->first()->value;
        $pressure = DB::table('standard_unit')->where('id', $pressure_id)->first()->value;
        $density = DB::table('standard_unit')->where('id', $density_id)->first()->value;

        $unitValues = array(
            'length' => $length,
            'pressure' => $pressure,
            'density' => $density,
        );

        $unitIds = array(
            'length_id' => $length_id,
            'pressure_id' => $pressure_id,
            'density_id' => $density_id,
            'temp_id' => $temp_id,
        );

        $unitValues = json_encode($unitValues);
        $unitIds = json_encode($unitIds);
        Session::put('unitValues', $unitValues);
        Session::put('unitIds', $unitIds);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id = $request->id;
        Temperature::where('TempID', $id)->delete();
        return redirect()->back();
    }
}
