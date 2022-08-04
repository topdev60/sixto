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
        $tab = $request->tab;
        $unitValues = array();
        $unitIds = array();
        if($tab == 1){
            $tvdUnit = DB::table('standard_unit')->where('id', $request->tvdUnit)->first()->value;
            $pressureUnit = DB::table('standard_unit')->where('id', $request->pressureUnit)->first()->value;
            $pressureGradientUnit = DB::table('standard_unit')->where('id', $request->pressureGradientUnit)->first()->value;
            $porepressure = array(
                'tvd' => $tvdUnit,
                'pressure' => $pressureUnit,
                'pressureGradient' => $pressureGradientUnit,
            );
            $unitValues['porepressure'] = $porepressure;
            $unitIds['porepressure'] = array(
                'tvd' => $request->tvdUnit,
                'pressure' => $request->pressureUnit,
                'pressureGradient' => $request->pressureGradientUnit
            );
        }
        
        if($tab == 2){
            $tvdUnit = DB::table('standard_unit')->where('id', $request->tvdUnit)->first()->value;
            $fractGradUnit = DB::table('standard_unit')->where('id', $request->fractGradUnit)->first()->value;
            $pressureUnit = DB::table('standard_unit')->where('id', $request->pressureUnit)->first()->value;
            $fracture = array(
                'tvd' => $tvdUnit,
                'fractGrad' => $fractGradUnit,
                'pressureUnit' => $pressureUnit,
            );
            $unitValues['fracture'] = $fracture;
            $unitIds['fracture'] = array(
                'tvd' => $request->tvdUnit,
                'fractGrad' => $request->fractGradUnit,
                'pressureUnit' => $request->pressureUnit
            );
        }

        if($tab == 3){
            $tvdUnit = DB::table('standard_unit')->where('id', $request->tvdUnit)->first()->value;
            $tempGradientUnit = DB::table('standard_unit')->where('id', $request->tempGradientUnit)->first()->value;
            $tempUnit =  DB::table('standard_unit')->where('id', $request->tempUnit)->first()->value;
            $formation = array(
                'tvd' => $tvdUnit,
                'tempGrad' => $tempGradientUnit,
                'temp' => $tempUnit,
            );
            $unitValues['formation'] = $formation;
            $unitIds['formation'] = array(
                'tvd' => $request->tvdUnit,
                'tempGrad' => $request->tempGradientUnit,
                'temp' => $request->tempUnit
            );
        }

        if($tab == 4){
            $mdUnit = DB::table('standard_unit')->where('id', $request->mdUnit)->first()->value;
            $tvdUnit = DB::table('standard_unit')->where('id', $request->tvdUnit)->first()->value;
            $tcUnit = DB::table('standard_unit')->where('id', $request->tcUnit)->first()->value;
            $shUnit = DB::table('standard_unit')->where('id', $request->shUnit)->first()->value;
            $lithology = array(
                'md' => $mdUnit,
                'tvd' => $tvdUnit,
                'tc' => $tcUnit,
                'sh' => $shUnit,
            );
            $unitValues['lithology'] = $lithology;
            $unitIds['lithology'] = array(
                'md' => $request->mdUnit,
                'tvd' => $request->tvdUnit,
                'tc' => $request->tcUnit,
                'sh' => $request->shUnit,
            );
        }
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
